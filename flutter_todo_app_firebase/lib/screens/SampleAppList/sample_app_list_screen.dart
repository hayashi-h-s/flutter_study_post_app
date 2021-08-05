
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app_firebase/screens/SampleAppList/popup_menu_example.dart';
import 'package:flutter_todo_app_firebase/screens/SampleAppList/ui_sample_tab_screen/ui_sample_tab.dart';

import 'bottom_drawer_example.dart';
import 'conponents/sample_app_list_body.dart';

//
// class SampleAppListScreen extends StatelessWidget {
//   // static String routeName = "/profile";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("サンプルアップ"),
//       ),
//       body: SampleAppListBody(),
//     );
//   }
// }
//


class SampleAppListScreen extends StatefulWidget {
  @override
  _SampleAppListScreenState createState() => _SampleAppListScreenState();
}

class _SampleAppListScreenState extends State<SampleAppListScreen> {
  int _selectedIndex = 0;

  static List<Widget> _pageList = [
    UiSampleTabScreen(),
    PoPupMenuScreen(),
    BottomDrawerExampleScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Tweet'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('News'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('MyPage'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class CustomPage extends StatelessWidget {
  final Color pannelColor;
  final String title;

  CustomPage({@required this.pannelColor, @required this.title});

  @override
  Widget build(BuildContext context) {
    final titleTextStyle = Theme.of(context).textTheme.title;
    return Container(
      child: Center(
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
              color: pannelColor,
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: titleTextStyle.fontSize,
                color: titleTextStyle.color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}


// class SampleAppListScreen extends StatefulWidget {
//   @override
//   _SampleAppListScreenState createState() => _SampleAppListScreenState();
// }
//
// class _SampleAppListScreenState extends State<SampleAppListScreen> {
//   int _selectedIndex = 0;
//
//   static List<Widget> _pageList = [
//     CustomPage(pannelColor: Colors.cyan, title: 'Home'),
//     CustomPage(pannelColor: Colors.green, title: 'Settings'),
//     CustomPage(pannelColor: Colors.pink, title: 'Search')
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('サンプル1'),
//       ),
//       body: _pageList[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             title: Text('Home'),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             title: Text('Setting'),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//             title: Text('Search'),
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
//
// class CustomPage extends StatelessWidget {
//   final Color pannelColor;
//   final String title;
//
//   CustomPage({@required this.pannelColor, @required this.title});
//
//   @override
//   Widget build(BuildContext context) {
//     final titleTextStyle = Theme.of(context).textTheme.title;
//     return Container(
//       child: Center(
//         child: Container(
//           width: 200,
//           height: 200,
//           decoration: BoxDecoration(
//               color: pannelColor,
//               borderRadius: BorderRadius.all(Radius.circular(20.0))),
//           child: Center(
//             child: Text(
//               title,
//               style: TextStyle(
//                 fontSize: titleTextStyle.fontSize,
//                 color: titleTextStyle.color,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
