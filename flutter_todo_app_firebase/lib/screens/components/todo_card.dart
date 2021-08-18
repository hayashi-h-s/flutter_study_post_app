import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_todo_app_firebase/screens/profile/user_model.dart';
import 'package:flutter_todo_app_firebase/todo_list_page_model.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../todo.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({
    Key key,
    this.todo,
    this.press,
  }) : super(key: key);

  final Todo todo;

  final VoidCallback press;

  @override
  // Widget build(BuildContext context) {
  Widget build(BuildContext context) =>
      Consumer<TodoListPageModel>(builder: (context, model, child) {
        final users = model.users;
        UserModel cardUser;
        for (var user in users) {
          if (todo.userId == user.userId) {
            cardUser = user;
          }
        }
        return InkWell(
          onTap: press,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding, vertical: kDefaultPadding * 0.75),
            child: Row(children: [
              Stack(
                children: [
                  /**
                   * アイコンの場合
                   */
                  // CircleAvatar(
                  //   radius: 24,
                  //   child: Icon(Icons.add),
                  // ),
                  cardUser.imageURL.isNotEmpty // imageURLが''(空)じゃない時に取得した画像を表示
                      ? CircleAvatar(
                          radius: 24,
                          backgroundImage: CachedNetworkImageProvider(
                            cardUser.imageURL,
                          ),
                          backgroundColor: Colors.blue,
                        )
                      : CircleAvatar(
                          radius: 24,
                          // child: Expanded( // 画面いっぱいに表示 https://bukiyo-papa.com/expanded/
                          child: Icon(
                            Icons.account_circle,
                            // ),
                          ),
                        ),
                  if (true)
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        height: 16,
                        width: 16,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              width: 3),
                        ),
                      ),
                    )
                ],
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        todo.title,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      if (todo.imageURL.isNotEmpty) // imageURLが''(空)じゃない時に表示
                        Image.network(
                          todo.imageURL,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return Center(
                              child: CircularProgressIndicator(
                                // value: loadingProgress.expectedTotalBytes != null
                                //     ? loadingProgress.cumulativeBytesLoaded /
                                //     loadingProgress.expectedTotalBytes
                                //     : null,
                                value: null,
                                backgroundColor: Colors.grey,
                              ),
                            );
                          },
                        ),

                      // SizedBox(
                      //   width: 100,
                      //   height: 160,
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       image: DecorationImage(
                      //         fit: BoxFit.fill,
                      //         image: NetworkImage(
                      //           todo.imageURL,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              Opacity(
                opacity: 0.64,
                child: Text(
                  todo.createdAtSt,
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ]),
          ),
        );
      });
}
