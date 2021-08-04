import 'package:flutter/material.dart';
import 'package:flutter_todo_app_firebase/add/add_page.dart';
import 'package:flutter_todo_app_firebase/screens/SampleAppList/sample_app_list_screen.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class ProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/User Icon.svg",
            press: () => {},
          ),
          ProfileMenu(
            text: "Notifications",
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Sample App List",
            icon: "assets/icons/Question mark.svg",
            press: () {
              print('Logs ');

              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SampleAppListScreen(),
                    fullscreenDialog: true,
                  ));
              // MaterialPageRoute(
              //   builder: (context) => SampleAppListScreen(),
              //   fullscreenDialog: true,
              // );
            },
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}
