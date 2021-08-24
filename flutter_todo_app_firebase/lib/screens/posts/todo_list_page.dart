import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app_firebase/screens/add/add_screen.dart';
import 'package:flutter_todo_app_firebase/screens/posts/todo_list_body.dart';
import 'package:provider/provider.dart';

import '../../todo_list_page_model.dart';

class TodoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodoListScreenModel>(
      create: (_) => TodoListScreenModel()..getTodoListAndUserListRealtime(),
      child: Scaffold(
        appBar: AppBar(
          // centerTitle: true, // 中央寄せ https://qiita.com/pikatyu3/items/59fbc3cf8eb1b4c89310
          title: Text("投稿一覧"),
        ),
        body: TodoListBody(),
        floatingActionButton:
            Consumer<TodoListScreenModel>(builder: (context, model, child) {
          return FloatingActionButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddPostScreen(model),
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
