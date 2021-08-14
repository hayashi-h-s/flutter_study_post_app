import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app_firebase/screens/components/todo_list_page.dart';

import 'package:flutter_todo_app_firebase/screens/profile/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseAuth auth = FirebaseAuth.instance;
  UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  print('Logs userCredential.user.uid; = $userCredential.user.uid');
  var currentUser = FirebaseAuth.instance.currentUser;

  if (currentUser != null) {
    print(currentUser.uid);
  }

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
    // CustomPage(pannelColor: Colors.green, title: 'Settings'),
    // CustomPage(pannelColor: Colors.pink, title: 'Search')
    ProfileScreen()
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
        title: const Text('投稿一覧'),
      ),
      body: _pageList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Tweet'),
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.settings),
          //   title: Text('News'),
          // ),
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
