import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app_firebase/util/user_util.dart';

class RegisterScreenModel extends ChangeNotifier {
  String nameText = '';
  File imageFile;
  bool isLoading = false;

  Future createUser() async {
    if (nameText == null || nameText.isEmpty) {
      return;
    }

    final imageURL = await _uploadImageFile();
    final userId = FirebaseAuth.instance.currentUser.uid;
    final collection =
        FirebaseFirestore.instance.collection('users').doc(userId);

    UserUtil.setUserData(collection, nameText, userId, imageURL);
  }

  /// FirebaseStorageに画像をuploadするメソッド
  Future<String> _uploadImageFile() async {
    if (imageFile == null) return '';
    final storage = FirebaseStorage.instance;
    final ref = storage.ref().child('todoList').child(nameText);
    final snapshot = await ref.putFile(imageFile);
    final downloadURL = await snapshot.ref.getDownloadURL();
    return downloadURL;
  }

  /// FirebaseStorageに画像をuploadするメソッド
  setImage(File imageFile) {
    this.imageFile = imageFile;
    notifyListeners();
  }

  startLoading() {
    this.isLoading = true;
    notifyListeners();
  }

  endLoading() {
    this.isLoading = false;
    notifyListeners();
  }

  setNameText(String nameText) {
    this.nameText = nameText;
    notifyListeners(); // これによって変化を動的に反映できる
  }
}
