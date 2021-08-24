import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app_firebase/screens/posts/todo_list_page.dart';
import 'package:flutter_todo_app_firebase/screens/profile/profile_screen.dart';
import 'package:flutter_todo_app_firebase/screens/register/register_screen.dart';
import 'package:flutter_todo_app_firebase/util/user_util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // 匿名ユーザーが存在しない場合は作成
  await FirebaseAuth.instance.signInAnonymously();
  await UserUtil.checkUserExist(); // 戻り値がFuture<T>のメソッドはawaitで取得する必要がある
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 未登録ユーザーなら登録画面へ遷移
    return UserUtil.isExistUser
        ? MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'TODOアプリ',
            // home: MainPage(),
            home: TopScreen(),
          )
        : MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'TODOアプリ',
            // home: MainPage(),
            home: RegisterScreen(),
          );
  }
}

class TopScreen extends StatefulWidget {
  @override
  _TopScreenState createState() => _TopScreenState();
}

class _TopScreenState extends State<TopScreen> {
  int _selectedIndex = 0;

  static List<Widget> _pageList = [TodoListPage(), ProfileScreen()];

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
            icon: Icon(Icons.article_outlined),
            title: Text('投稿'),
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.settings),
          //   title: Text('News'),
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('その他'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
