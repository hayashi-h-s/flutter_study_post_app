import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../main_model.dart';
import 'add_model.dart';

class AddPage extends StatelessWidget {
  final MainModel model;

  AddPage(this.model);

  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainModel>(
      create: (_) => MainModel(), // MainModelを再生成している
      child: Stack(
        children: <Widget>[
          Scaffold(
            resizeToAvoidBottomInset: false, //
            appBar: AppBar(
              title: Text('新規追加'),
            ),
            body: Consumer<MainModel>(builder: (context, model, child) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    InkWell( // https://qiita.com/mkosuke/items/e506256515179d0f421b
                      onTap: () async {
                        final pickedFile =
                            await picker.getImage(source: ImageSource.gallery);
                        // 画像をセットするメソッド
                        model.setImage(File(pickedFile
                            .path)); // キャッシュに保存した値をセット pickedFile.path =/data/user/0/com.todoapp.flutter_todo_app_firebase/cache/image_picker7938321804922081782.jpg
                      },
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
                        await model.add();
                        Navigator.pop(context);
                        model.endLoading();
                      },
                    ),
                  ],
                ),
              );
            }),
          ),
          Consumer<MainModel>(builder: (context, model, child) {
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
