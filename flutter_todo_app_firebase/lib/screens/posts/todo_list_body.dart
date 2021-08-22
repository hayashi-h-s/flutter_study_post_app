import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app_firebase/conponents/filled_outline_button.dart';
import 'package:flutter_todo_app_firebase/screens/posts/todo_card.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../todo_list_page_model.dart';
import '../../todo.dart';

class TodoListBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Consumer<TodoListScreenModel>(builder: (context, model, child) {
    final todoList = model.todoList;
    return Column(
      children: [
        // Container(
        //   padding: EdgeInsets.fromLTRB(
        //       kDefaultPadding, 0, kDefaultPadding, kDefaultPadding),
        //   color: kPrimaryColor,
        //   child: Row(
        //     children: [
        //       FillOutlineButton(press: () {}, text: "Recent Message" ),
        //       SizedBox(width: kDefaultPadding),
        //       FillOutlineButton(
        //         press: () {},
        //         text: "Active",
        //         isFilled: false,
        //       ),
        //     ],
        //   ),
        // ),
        Expanded(
          // https://qiita.com/nannany_hey/items/d4114f615e4d53964121  //RowやColumnの子Widget間の隙間を目一杯埋めたいときに使います
          child: ListView.builder(
            // itemCount: todoList.length,
            itemCount: todoList.length,
            itemBuilder: (context, index) => TodoCard(
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
