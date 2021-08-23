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
  Widget build(BuildContext context) =>
      Consumer<ProfileModel>(builder: (context, model, child) {
        final user = model.user;
        return Container(
          child: SizedBox(
            height: 115,
            width: 115,
            child: Stack(fit: StackFit.expand, children: [
              Container(
                /// Stackを使用することで読込中の背景を表示
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
              user.profileImageURL.isNotEmpty
                  ? Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(110.0),
                        child: Image.network(
                          user.profileImageURL,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return Center(
                              child: CircularProgressIndicator(
                                value: null,
                              ),
                            );
                          },

                          /// レイアウトいっぱいに表示
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.grey,
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
                    child: Icon(Icons.add, color: Colors.black),
                  ),
                ),
              )
            ]),
          ),
        );
      });
}
