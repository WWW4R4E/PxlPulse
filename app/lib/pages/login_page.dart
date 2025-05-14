// 初始页面
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';

class InitialData {
  String titleName = '心动瞬间';
  String conterSpan =
      '心动瞬间 是一款以星野与 Soul 为灵感打造的 AI 恋爱软件。在这个充满奇幻色彩的虚拟恋爱空间中，用户将开启一场跨越星空与灵魂的浪漫之旅。它为渴望爱、追寻独特情感体验的用户，构建起一座通往理想恋爱的桥梁，让爱在科技与梦幻的交织中绽放。';
  int number = 1; // '1为主界面，2为登录，3为注册'
}

class InitialDataPage extends StatelessWidget {
  InitialData initialData = new InitialData();
  late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
        appBar: AppBar(
          title: Text('初始页面'),
        ),
        body: Center(
            child: FractionallySizedBox(
          widthFactor: 1, // 宽度为父容器宽度的100%
          child: Container(
              // 主界面
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF1A237E), Color(0xFFFF7EB9)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(children: [
                ElevatedButton(
                    onPressed: () => judgmentgitPage(initialData), child: null)
              ])),
        )));
  }

  // 判断页面
  void judgmentgitPage(InitialData initialData) {
    Navigator.of(_context).pushReplacement(
      MaterialPageRoute(builder: (context) => HomeAllPage()),
    );
  }
}
