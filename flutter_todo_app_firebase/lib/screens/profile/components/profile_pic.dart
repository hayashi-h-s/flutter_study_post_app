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
        model.getCurrentUser(); // 無駄な処理かも？

        return SizedBox(
          height: 115,
          width: 115,
          child: Stack(
            fit: StackFit.expand,
            overflow: Overflow.visible,
            children: [
              model.profileImageURL != null
                  ? CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage(model.profileImageURL),
                    )
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
                        // model.setImage(File(pickedFile.path));

                        print('Logs pickedFile =$pickedFile');

                        model.getCurrentUser(); //テスト用

                        if (pickedFile != null) {
                          model.setImage(
                            (File(pickedFile.path)),
                          );

                          // model.startLoading();
                          await model.add(); // FireStoreに値を追加する
                          // model.endLoading();
                        }
                      },
                      child: Icon(Icons.ac_unit)),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
