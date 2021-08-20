import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class ProfileModel extends ChangeNotifier {
  File imageFile;
  String profileImageURL;
  bool isLoading = false;

  /// ProfileModelにFileを保持するメソッドs
  setImage(File imageFile) {
    this.imageFile = imageFile;
  }

  Future addUser() async {
    final userId = FirebaseAuth.instance.currentUser.uid;
    final collection =
        FirebaseFirestore.instance.collection('users').doc(userId);
    final imageURL = await _uploadProfileImageFile();
    await collection.set({
      'userId': userId,
      'imageURL': imageURL,
      'createdAt': Timestamp.now(),
    });
  }

  /// FirebaseStorageに画像をuploadするメソッド
  Future<String> _uploadProfileImageFile() async {
    if (imageFile == null) {
      return '';
    }
    final storage = FirebaseStorage.instance;
    final ref = storage.ref().child('users');
    final snapshot = await ref.putFile(imageFile);
    final downloadURL = await snapshot.ref.getDownloadURL();
    return downloadURL;
  }

  Future getCurrentUser() async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        profileImageURL = documentSnapshot.get("imageURL"); // 特定のコレクションの値を取得
        notifyListeners();
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  startLoading() {
    isLoading = true;
    notifyListeners();
  }

  endLoading() {
    isLoading = false;
    notifyListeners();
  }
}
