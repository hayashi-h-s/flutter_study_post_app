import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../todo_list_page_model.dart';

class AddPostScreen extends StatelessWidget {
  final TodoListScreenModel model;

  AddPostScreen(this.model);

  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodoListScreenModel>(
      create: (_) => TodoListScreenModel(), // MainModelを再生成している
      child: Stack(
        children: <Widget>[
          Scaffold(
            resizeToAvoidBottomInset: false, //
            appBar: AppBar(
              title: Text('新規追加'),
            ),
            body:
                Consumer<TodoListScreenModel>(builder: (context, model, child) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    InkWell(
                      // https://qiita.com/mkosuke/items/e506256515179d0f421b
                      onTap: () async {
                        final pickedFile =
                            await picker.getImage(source: ImageSource.gallery);
                        // 画像をセットするメソッド
                        model.setImage(File(
                          pickedFile.path,
                        )); // キャッシュに保存した値をセット pickedFile.path =/data/user/0/com.todoapp.flutter_todo_app_firebase/cache/image_picker7938321804922081782.jpg
                      },
                      child: SizedBox(
                        height: 180,
                        width: 200,
                        // double.infinity, // 最大まで広げる h// ttps://flutter.dev/docs/development/ui/layout/constraints
                        child: Stack(children: [
                          //fit: StackFit.expand =
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: 100,
                              height: 160,
                              child:
                                  // 画像があるか否かを判断する三項演算子
                                  model.imageFile != null
                                      ? Image.file(model.imageFile)
                                      : Container(
                                          color: Colors.grey,
                                        ),
                            ),
                          ),
                          Positioned(
                            right: 30,
                            bottom: 0,
                            child: SizedBox(
                              height: 46,
                              width: 46,
                              child: FlatButton(
                                padding: EdgeInsets.zero,
                                color: Colors.blue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                onPressed: () async {
                                  // メソッドをまとめる

                                  final pickedFile = await picker.getImage(
                                      source: ImageSource.gallery);
                                  // 画像をセットするメソッド
                                  model.setImage(File(
                                    pickedFile.path,
                                  )); // キャッシュ
                                },
                                child: Icon(Icons.add, color: Colors.white),
                              ),
                            ),
                          )
                        ]),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "投稿",
                        hintText: "今日は何をしましたか？",
                      ),
                      onChanged: (text) {
                        model.newTodoText = text;
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                      child: Text('追加する'),
                      onPressed: () async {
                        model.startLoading();
                        // firestoreに値を追加する
                        await model.addPost();
                        Navigator.pop(context);
                        model.endLoading();
                      },
                    ),
                  ],
                ),
              );
            }),
          ),
          Consumer<TodoListScreenModel>(builder: (context, model, child) {
            return model.isLoading
                ? Container(
                    color: Colors.black.withOpacity(0.3),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : SizedBox();
          }),
        ],
      ),
    );
  }
}