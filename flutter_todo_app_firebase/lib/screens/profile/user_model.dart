import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo_app_firebase/todo.dart';

class UserModel extends ChangeNotifier {
  List<Todo> todoList = [];
  String newTodoText = '';

  Future getTodoList() async {

    print('Logs Future getTodoList() async {');

    final snapshot =
    await FirebaseFirestore.instance.collection('todoList').get();
    final docs = snapshot.docs;
    final todoList = docs.map((doc) => Todo(doc)).toList();
    this.todoList = todoList;

    print('Logs for (int i = 0; i < this.todoList.length; i++){');

    for (int i = 0; i < this.todoList.length; i++){

      print('Logs this.todoList[i] = $this.todoList[i]');
    }


    notifyListeners();
  }

  void getTodoListRealtime() {

    print('Logs void getTodoListRealtime() {');

    final snapshots =
    FirebaseFirestore.instance.collection('todoList').snapshots();

    print('Logs snapshots =$snapshots');

    snapshots.listen((snapshot) {

      print('Logs snapshots.listen((snapshot) {');

      final docs = snapshot.docs;
      final todoList = docs.map((doc) => Todo(doc)).toList();
      todoList.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      this.todoList = todoList;
      notifyListeners();

      print('Logs for (int i = 0; i < this.todoList.length; i++){');

      for (int i = 0; i < this.todoList.length; i++){

        print('Logs this.todoList[i] = $this.todoList[i]');
      }


    });
  }

  Future add() async {
    final collection = FirebaseFirestore.instance.collection('todoList');
    await collection.add({
      'title': newTodoText,
      'createdAt': Timestamp.now(),
    });
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