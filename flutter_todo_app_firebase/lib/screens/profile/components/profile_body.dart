import 'package:flutter/material.dart';
import 'package:flutter_todo_app_firebase/screens/SampleAppList/sample_app_list_screen.dart';
import 'package:flutter_todo_app_firebase/screens/profile/profile_model.dart';
import 'package:provider/provider.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class ProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileModel>(
        create: (_) => ProfileModel()..getCurrentUser(),
        builder: (context, snapshot) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                ProfilePic(),
                // SizedBox(height: 10),
                // ProfileMenu(
                //   text: "My Account",
                //   icon: "assets/icons/User Icon.svg",
                //   press: () => {},
                // ),
                // ProfileMenu(
                //   text: "Notifications",
                //   icon: "assets/icons/Bell.svg",
                //   press: () {},
                // ),
                // ProfileMenu(
                //   text: "Settings",
                //   icon: "assets/icons/Settings.svg",
                //   press: () {},
                // ),
                // ProfileMenu(
                //   text: "Help Center",
                //   icon: "assets/icons/Question mark.svg",
                //   press: () {},
                // ),
                ProfileMenu(
                  text: "サンプルアプリ一覧",
                  icon: "assets/icons/Question mark.svg",
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SampleAppListScreen(),
                          fullscreenDialog: true,
                        ));
                  },
                ),
                // ProfileMenu(
                //   text: "ログアウト",
                //   icon: "assets/icons/Log out.svg",
                //   press: () {},
                // ),
              ],
            ),
          );
        });
  }
}
