import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app_firebase/screens/add/add_screen.dart';
import 'package:flutter_todo_app_firebase/screens/posts/posts_body.dart';
import 'package:provider/provider.dart';

import 'todo_list_page_model.dart';

class PostsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PostsScreenModel>(
      create: (_) => PostsScreenModel()..getTodoListAndUserListRealtime(),
      child: Scaffold(
        appBar: AppBar(
          // centerTitle: true, // 中央寄せ https://qiita.com/pikatyu3/items/59fbc3cf8eb1b4c89310
          title: Text("投稿一覧"),
        ),
        body: PostsBody(),
        floatingActionButton:
            Consumer<PostsScreenModel>(builder: (context, model, child) {
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
