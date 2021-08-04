import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app_firebase/add/add_page.dart';
import 'package:flutter_todo_app_firebase/conponents/coustom_bottom_nav_bar.dart';
import 'package:flutter_todo_app_firebase/main_model.dart';
import 'package:flutter_todo_app_firebase/screens/components/test_todo_list_body.dart';
import 'package:flutter_todo_app_firebase/screens/components/todo_card.dart';
import 'package:flutter_todo_app_firebase/screens/components/todo_list_body.dart';
import 'package:flutter_todo_app_firebase/screens/components/todo_list_page.dart';
import 'package:provider/provider.dart';

import '../../add/add_model.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../../enums.dart';

void main() async {
  print('Logs print');

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseAuth auth = FirebaseAuth.instance;

  print('Logs auth = $auth = auth.id = $auth.' );

  UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();

  print('Logs userCredential = $userCredential');
  print('Logs userCredential = $userCredential');

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODOアプリ',
      // home: MainPage(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> _pageList = [
    TodoListPage(),
    CustomPage(pannelColor: Colors.green, title: 'Settings'),
    CustomPage(pannelColor: Colors.pink, title: 'Search')
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('サンプル1'),
      ),
      body: _pageList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Setting'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}


//
// class MainPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<MainModel>(
//       create: (_) => MainModel()..getTodoListRealtime(),
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('TODOアプリ'),
//           actions: [
//             Consumer<MainModel>(builder: (context, model, child) {
//               final isActive = model.checkShouldActiveCompleteButton();
//               return TextButton(
//                 onPressed: isActive
//                     ? () async {
//                         await model.deleteCheckedItems();
//                       }
//                     : null,
//                 child: Text(
//                   '完了',
//                   style: TextStyle(
//                     color:
//                         isActive ? Colors.white : Colors.white.withOpacity(0.5),
//                   ),
//                 ),
//               );
//             })
//           ],
//         ),
//         // body:TestTodoListBody(),
//         body: TodoListBody(),
//         floatingActionButton:
//             Consumer<MainModel>(builder: (context, model, child) {
//           return FloatingActionButton(
//             onPressed: () async {
//               await Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => AddPage(model),
//                   fullscreenDialog: true,
//                 ),
//               );
//             },
//             child: Icon(Icons.add),
//           );
//         }),
//         bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
//       ),
//     );
//   }
// }

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
