import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_todo_app_firebase/screens/register/register_screen_model.dart';
import 'package:flutter_todo_app_firebase/util/toast_util.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class RegisterScreen extends StatelessWidget {
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterScreenModel>(
      create: (_) => RegisterScreenModel(), // MainModelを再生成している
      child: Stack(
        children: <Widget>[
          Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              centerTitle: true,
              title: Text('ユーザー登録'),
            ),
            body:
                Consumer<RegisterScreenModel>(builder: (context, model, child) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 115,
                      width: 115,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(110.0),
                              child: model.imageFile != null
                                  ? Image.file(model.imageFile)
                                  : Container(
                                      color: Colors.grey,
                                    ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: SizedBox(
                              height: 46,
                              width: 46,
                              child: FlatButton(
                                padding: EdgeInsets.zero,
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                onPressed: () async {
                                  final pickedFile = await picker.getImage(
                                      source: ImageSource.gallery);
                                  // 画像をセットするメソッド
                                  if (pickedFile != null) {
                                    model.setImage(
                                      (File(pickedFile.path)),
                                    );
                                  }
                                },
                                child: Icon(Icons.add, color: Colors.black),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "ユーザー名",
                        hintText: "山田 太郎",
                      ),
                      onChanged: (text) {
                        model.setNameText(text);
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Consumer<RegisterScreenModel>(
                        builder: (context, model, child) {
                      return (model.nameText.length > 0)
                          ? ElevatedButton(
                              child: Text('登録'),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                                onPrimary: Colors.white,
                              ),
                              onPressed: () async {
                                if (model.nameText == null ||
                                    model.nameText.isEmpty) {
                                  ToastUtil.showToastText("最低でも1文字以上は入力してください");
                                  return;
                                }
                                model.startLoading();
                                // FireStoreに値を追加する
                                await model.createUser();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TopScreen(),
                                      fullscreenDialog: true,
                                    ));
                                model.endLoading();
                                ToastUtil.showToastText("ユーザー登録が登録が完了しました");
                              },
                            )
                          : ElevatedButton(
                              child: Text('登録'),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.grey,
                                onPrimary: Colors.white,
                              ),
                              onPressed: () async {
                                ToastUtil.showToastText("最低でも1文字以上は入力してください");
                              },
                            );
                    }),
                  ],
                ),
              );
            }),
          ),
          Consumer<RegisterScreenModel>(builder: (context, model, child) {
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
