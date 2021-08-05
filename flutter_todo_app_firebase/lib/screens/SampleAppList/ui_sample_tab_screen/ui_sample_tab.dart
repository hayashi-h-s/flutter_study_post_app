
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app_firebase/screens/SampleAppList/ui_sample_tab_screen/progress_indicator_example.dart';
import 'package:flutter_todo_app_firebase/screens/components/todo_list_page.dart';

import '../bottom_drawer_example.dart';
import '../popup_menu_example.dart';

class UiSampleTabScreen extends StatelessWidget {
  const UiSampleTabScreen({Key key}) : super(key: key);

  static List<Widget> _tabPageList = [
    PoPupMenuScreen(),
    BottomDrawerExampleScreen(),
    ProgressIndicatorExampleScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                /**
                 *タブをアイコンにする場合
                    Tab(icon: Icon(Icons.directions_car)),
                    Tab(icon: Icon(Icons.directions_transit)),
                 */
                Text('PoPupMenu'),
                Text('BottomDrawer'),
                Text('ProgressIndicator'),
                // Text(' ProgressIndicator'),
              ],
            ),
            title: const Text('サンプルアプリ一覧'),
          ),
          body: TabBarView(
            children: _tabPageList
          ),
        ),
      ),
    );
  }
}