
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app_firebase/screens/SampleAppList/ui_sample_tab_screen/page_scroll_view.dart';
import 'package:flutter_todo_app_firebase/screens/SampleAppList/ui_sample_tab_screen/progress_indicator_example.dart';
import 'package:flutter_todo_app_firebase/screens/components/todo_list_page.dart';

import '../bottom_drawer_example.dart';
import '../future_builder_example_screen.dart';
import '../popup_menu_example.dart';
import '../side_menu_drawer_example.dart';
import 'button_sample_list.dart';

class UiSampleTabScreen extends StatelessWidget {
  const UiSampleTabScreen({Key key}) : super(key: key);

  static List<Widget> _tabPageList = [
    PoPupMenuScreen(),
    BottomDrawerExampleScreen(),
    ProgressIndicatorExampleScreen(),
    SideMenuDrawerExampleScreen(),
    ButtonSampleListScreen(),
    FutureBuilderExampleScreen(), // https://api.flutter.dev/flutter/widgets/FutureBuilder-class.html
    // PageScrollView(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              isScrollable: true, //タブのスクロール機能 https://www.virment.com/use-scrollable-tabbar-in-flutter/
              // unselectedLabelColor: Colors.white.withOpacity(0.3),
              unselectedLabelStyle: TextStyle(fontSize: 12.0),
              labelColor: Colors.yellowAccent,
              labelStyle: TextStyle(fontSize: 16.0),
              indicatorColor: Colors.white,
              indicatorWeight: 2.0,
              tabs: [
                /**
                 *タブをアイコンにする場合
                    Tab(icon: Icon(Icons.directions_car)),
                    Tab(icon: Icon(Icons.directions_transit)),
                 */
                Text('PoPupMenu'),
                Text('BottomDrawer'),
                Text('ProgressIndicator'),
                Text('SideMenuDrawerExample'),
                Text('ButtonSampleListScreen'),
                Text('FutureBuilderExampleScreen'),
                // Text('PageScrollView'),
                // Text(' ProgressIndicator'),
              ],
            ),
            title: const Text('サンプル一覧'),
          ),
          body: TabBarView(
            children: _tabPageList
          ),
        ),
      ),
    );
  }
}