import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding * 0.75),
        child: Row(
          children: [
            Stack(
              children: [
                /**
                 * アイコンの場合
                 */
                // CircleAvatar(
                //   radius: 24,
                //   child: Icon(Icons.add),
                // ),
                CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(
                    'https://wired.jp/app/uploads/2018/01/GettyImages-522585140.webp',
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
            CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(
                todo.imageURL,
              ),
            ),
            // CircleAvatar(
            //   radius: 24,
            //   // child: Image.network(todo.imageURL),
            //   child: Image.network(
            //     'data:image/jpeg;base64,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',
            //   ),
            // ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      todo.title,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    // SizedBox(height: 8),
                    // Opacity(
                    //   opacity: 0.64,
                    //   child: Text(
                    //     todo.title,
                    //     maxLines: 1,
                    //     overflow: TextOverflow.ellipsis,
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
          ],
        ),
      ),
    );
  }
}
