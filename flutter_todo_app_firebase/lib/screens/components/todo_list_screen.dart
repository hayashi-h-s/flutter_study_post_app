import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app_firebase/add/add_page.dart';
import 'package:flutter_todo_app_firebase/main_model.dart';
import 'package:flutter_todo_app_firebase/screens/components/test_todo_list_body.dart';
import 'package:flutter_todo_app_firebase/screens/components/todo_card.dart';
import 'package:flutter_todo_app_firebase/screens/components/todo_list_body.dart';
import 'package:provider/provider.dart';

import '../../add/add_model.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODOアプリ',
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainModel>(
      create: (_) => MainModel()..getTodoListRealtime(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('TODOアプリ'),
          actions: [
            Consumer<MainModel>(builder: (context, model, child) {
              final isActive = model.checkShouldActiveCompleteButton();
              return TextButton(
                onPressed: isActive
                    ? () async {
                  await model.deleteCheckedItems();
                }
                    : null,
                child: Text(
                  '完了',
                  style: TextStyle(
                    color:
                    isActive ? Colors.white : Colors.white.withOpacity(0.5),
                  ),
                ),
              );
            })
          ],
        ),
        // body:TestTodoListBody(),
        body:TodoListBody(),
        floatingActionButton:
        Consumer<MainModel>(builder: (context, model, child) {
          return FloatingActionButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddPage(model),
                  fullscreenDialog: true,
                ),
              );
            },
            child: Icon(Icons.add),
          );
        }),
      ),
    );
  }
}