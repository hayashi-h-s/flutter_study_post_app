import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app_firebase/conponents/filled_outline_button.dart';
import 'package:flutter_todo_app_firebase/screens/posts/post_card.dart';
import 'package:flutter_todo_app_firebase/screens/posts/posts_page_model.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../post.dart';

class PostsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Consumer<PostsScreenModel>(builder: (context, model, child) {
    final todoList = model.todoList;
    return Column(
      children: [
        Expanded( // RowやColumnの子Widget間の隙間を目一杯埋めたいときに使います
          child: ListView.builder(
            // itemCount: todoList.length,
            itemCount: todoList.length,
            itemBuilder: (context, index) => PostCard(
              todo: todoList[index],
              press: () => Navigator.push(
                context,
                MaterialPageRoute(
                    // builder: (context) => AddPage(),
                    ),
              ),
            ),
          ),
        ),
      ],
    );

  });
}
