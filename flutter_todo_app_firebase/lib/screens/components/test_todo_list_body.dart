import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app_firebase/conponents/filled_outline_button.dart';
import 'package:flutter_todo_app_firebase/main_model.dart';
import 'package:flutter_todo_app_firebase/screens/components/todo_card.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../todo.dart';

class TestTodoListBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Consumer<MainModel>(builder: (context, model, child) {
      final todoList = model.todoList;

      // Expanded( // https://qiita.com/nannany_hey/items/d4114f615e4d53964121  //RowやColumnの子Widget間の隙間を目一杯埋めたいときに使います
      //   child: ListView.builder(
      //     itemCount: todoList.length,
      //     itemBuilder: (context, index) => TodoCard(
      //       chat: todoList,
      //       press: () => Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) => MessagesScreen(),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
      //

      return ListView(
        children: todoList
            .map(
              (todo) => CheckboxListTile(
                title: Text(todo.title),
                value: todo.isDone,
                onChanged: (bool value) {
                  // todo.isDone = !todo.isDone;
                  todo.isDone = true;
                  model.reload();
                },
              ),
            )
            .toList(),
      );
    });
}
