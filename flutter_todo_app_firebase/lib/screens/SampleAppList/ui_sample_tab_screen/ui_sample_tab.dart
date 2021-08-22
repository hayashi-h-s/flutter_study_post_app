import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app_firebase/screens/SampleAppList/ui_sample_tab_screen/progress_indicator_example.dart';

import 'bottom_drawer_example.dart';
import 'button_sample_list.dart';
import 'future_builder_example_screen.dart';
import 'popup_menu_example.dart';
import 'shared_preferences_example.dart';
import 'side_menu_drawer_example.dart';

class UiSampleTabScreen extends StatelessWidget {
  const UiSampleTabScreen({Key key}) : super(key: key);

  static List<Widget> _tabPageList = [
    PoPupMenuScreen(),
    BottomDrawerExampleScreen(),
    ProgressIndicatorExampleScreen(),
    SideMenuDrawerExampleScreen(),
    ButtonSampleListScreen(),
    FutureBuilderExampleScreen(),
    // https://api.flutter.dev/flutter/widgets/FutureBuilder-class.html
    SharedPreferencesExampleScreen(),
    // https://flutter.dev/docs/cookbook/persistence/key-value
    // PageScrollView(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: _tabPageList.length,
        child: Scaffold(
          appBar: AppBar(
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(80),
              // タブの高さを変更https://tamappe.com/2020/02/14/2020-02-14-200000/
              child: const TabBar(
                isScrollable: true,
                //タブのスクロール機能 https://www.virment.com/use-scrollable-tabbar-in-flutter/
                // unselectedLabelColor: Colors.white.withOpacity(0.3),
                unselectedLabelStyle: TextStyle(
                  fontSize: 16.0,
                ),
                labelColor: Colors.white,
                labelPadding: EdgeInsets.symmetric(
                  // タブ文字にpaddingを設ける処理 https://stackoverflow.com/questions/51239291/how-to-customize-tabbar-width-in-flutter
                  vertical: 10.0,
                  horizontal: 10,
                ),
                labelStyle: TextStyle(fontSize: 16.0),
                indicatorColor: Colors.white,
                indicatorWeight: 1.0,
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
                  Text('SharedPreferencesExampleScreen'),
                  // Text('PageScrollView'),
                  // Text(' ProgressIndicator'),
                ],
              ),
            ),
            title: const Text('サンプル一覧'),
          ),
          body: TabBarView(children: _tabPageList),
        ),
      ),
    );
  }
}
