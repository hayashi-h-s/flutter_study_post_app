import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app_firebase/screens/profile/user_model.dart';
import 'package:flutter_todo_app_firebase/todo.dart';

class TodoListScreenModel extends ChangeNotifier {
  List<Todo> todoList = [];
  List<UserModel> users = [];
  File imageFile;
  String newTodoText = '';
  bool isLoading = false;

  startLoading() {
    isLoading = true;
    notifyListeners();
  }

  endLoading() {
    isLoading = false;
    notifyListeners();
  }

  Future getTodoList() async {
    // final snapshot =
    //     await FirebaseFirestore.instance.collection('todoList').get();
    final snapshot =
        await FirebaseFirestore.instance.collectionGroup('todoList').get();

    final docs = snapshot.docs;
    final todoList = docs.map((doc) => Todo(doc)).toList();
    this.todoList = todoList;

    notifyListeners();
  }

  void getTodoListAndUserListRealtime() {
    // final snapshots =
    //     FirebaseFirestore.instance.collection('todoList').snapshots();
    /// コレクショングループによる取得
    final todoListSnapshots =
        FirebaseFirestore.instance.collectionGroup('todoList').snapshots();

    todoListSnapshots.listen((snapshot) {
      final docs = snapshot.docs;
      final todoList = docs.map((doc) => Todo(doc)).toList();
      todoList.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      this.todoList = todoList;
      notifyListeners();
    });

    final usersSnapshots =
        FirebaseFirestore.instance.collection('users').snapshots();

    usersSnapshots.listen((snapshot) {
      final docs = snapshot.docs;
      final users = docs.map((doc) => UserModel(doc)).toList();
      this.users = users;
      notifyListeners();
    });
  }

  Future addPost() async {
    if (newTodoText == null) return;
    final userId = FirebaseAuth.instance.currentUser.uid;

    /// userに紐づくtodoListの取得
    final collection = FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .collection('todoList');

    final imageURL = await _uploadImageFile();

    await collection.add({
      'userId': userId,
      'title': newTodoText,
      'imageURL': imageURL,
      'createdAt': Timestamp.now(),
    });
  }

  setImage(File imageFile) {
    this.imageFile = imageFile;
    notifyListeners();
  }

  /// FirebaseStorageに画像をuploadするメソッド
  Future<String> _uploadImageFile() async {
    if (imageFile == null) {
      return '';
    }
    final storage = FirebaseStorage.instance;
    final ref = storage.ref().child('todoList').child(newTodoText);
    final snapshot = await ref.putFile(imageFile);
    final downloadURL = await snapshot.ref.getDownloadURL();
    return downloadURL;
  }

  void reload() {
    notifyListeners();
  }

  Future deleteCheckedItems() async {
    final checkedItems = todoList.where((todo) => todo.isDone).toList();
    final references =
        checkedItems.map((todo) => todo.documentReference).toList();

    final batch = FirebaseFirestore.instance.batch();

    references.forEach((reference) {
      batch.delete(reference);
    });
    return batch.commit();
  }

  bool checkShouldActiveCompleteButton() {
    final checkedItems = todoList.where((todo) => todo.isDone).toList();
    return checkedItems.length > 0;
  }
}
