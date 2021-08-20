import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_todo_app_firebase/screens/profile/profile_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfilePic extends StatelessWidget {
  ProfilePic({
    Key key,
  }) : super(key: key);

  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileModel>(
      create: (_) => ProfileModel(), // MainModelを再生成している
      child: Consumer<ProfileModel>(builder: (context, model, child) {
        model.getCurrentUser();
        return SizedBox(
          height: 115,
          width: 115,
          child: Stack(
            fit: StackFit.expand,
            overflow: Overflow.visible,
            children: [
              Container( /// Stackを使用することで読込中の背景を表示
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(110.0),
                  child: Container(
                    color: Colors.grey,
                  //   /// アイコンの表示
                  //   child: Icon(
                  //     Icons.account_circle,
                  //   ),
                  ),
                ),
              ),
              model.profileImageURL != null
                  ? Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(110.0),
                        child: Image.network(
                          model.profileImageURL,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return Center(
                              child: CircularProgressIndicator(
                                value: null,
                                // value: loadingProgress.expectedTotalBytes !=
                                //         null
                                //     ? loadingProgress.cumulativeBytesLoaded /
                                //         loadingProgress.expectedTotalBytes
                                //     : null,
                                // color: Colors.green , /// インジケータの色を変更
                                // backgroundColor: Colors.green, /// 背景色
                              ),
                            );
                          },
                          fit: BoxFit.cover,
                          /// レイアウトいっぱいに表示
                        ),
                      ),
                    )
                  /// URLから画像を表示する処理
                  // Image.network(model.profileImageURL)
                  // CircleAvatar(
                  //         radius: 24,
                  //         foregroundImage: Image.network(model.profileImageURL),
                  //       )
                  : CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.grey,
                    ),
              Positioned(
                right: -16,
                bottom: 0,
                child: SizedBox(
                  height: 46,
                  width: 46,
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(color: Colors.white),
                      ),
                      color: Color(0xFFF5F6F9),
                      onPressed: () async {
                        final pickedFile =
                            await picker.getImage(source: ImageSource.gallery);
                        // 画像をセットするメソッド
                        if (pickedFile != null) {
                          model.setImage(
                            (File(pickedFile.path)),
                          );
                          model.startLoading();
                          await model.addUser(); // FireStoreに値を追加する
                          model.endLoading();
                        }
                      },
                      child: Icon(Icons.add)),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
