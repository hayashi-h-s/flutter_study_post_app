import 'package:flutter/material.dart';
import 'package:flutter_todo_app_firebase/screens/SampleAppList/conponents/profile_pic.dart_pic.dart';
import 'package:flutter_todo_app_firebase/screens/SampleAppList/conponents/sample_app_list_menu.dart';


class SampleAppListBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          SampleAppListPic(),
          SizedBox(height: 20),
          SampleAppListMenu(
            text: "My Account",
            icon: "assets/icons/User Icon.svg",
            press: () => {},
          ),
          SampleAppListMenu(
            text: "Notifications",
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          SampleAppListMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          SampleAppListMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          SampleAppListMenu(
            text: "Sample App List",
            icon: "assets/icons/Question mark.svg",
            press: () {

            },
          ),
          SampleAppListMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}
