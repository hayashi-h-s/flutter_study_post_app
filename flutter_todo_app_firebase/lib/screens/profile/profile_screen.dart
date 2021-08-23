import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/profile_body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("その他"),
      ),
      body: ProfileBody(),
    );
  }
}
