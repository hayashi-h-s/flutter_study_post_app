import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app_firebase/add/add_page.dart';
import 'package:flutter_todo_app_firebase/screens/components/todo_list_body.dart';
import 'package:provider/provider.dart';

import '../../todo_list_page_model.dart';

class TodoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodoListPageModel>(
      create: (_) => TodoListPageModel()..getTodoListAndUserListRealtime(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("投稿一覧"),
        ),
        body: TodoListBody(),
        floatingActionButton:
            Consumer<TodoListPageModel>(builder: (context, model, child) {
          return FloatingActionButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddPostPage(model),
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
