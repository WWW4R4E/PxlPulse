import 'package:flutter/material.dart';
// 假设这些是你想通过底部导航栏访问的页面
import 'package:flutter_application_1/pages/index.dart'; // HomeAllPage 的位置
import 'package:flutter_application_1/pages/user_page.dart'; // 确保正确导入所有需要的页面
// 导入其他必要的页面如 CharacterPage 和 FriendPage

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(), // 首页为登录页
        '/main': (context) => MainPage(), // 主页面（带底部导航）
      },
    );
  }
}

// ===== 主页面（带底部导航栏）=====
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    HomeAllPage(),       // 页面1：主页
    CharacterPage(),     // 页面2：角色
    FriendPage(),        // 页面3：好友
    UserPage(),          // 页面4：我的
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _pages.elementAt(_selectedIndex), // 根据_selectedIndex显示对应页面
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '角色'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: '会员'), // 替换了帖子图标
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '我的'),
        ],
        currentIndex: _selectedIndex, // 当前选中的索引
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped, // 处理点击事件
      ),
    );
  }
}