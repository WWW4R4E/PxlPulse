// 初始页面
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/login_page/login.dart';

class InitialData{
  String titleName = '心动瞬间';
  String conterSpan = '心动瞬间 是一款以星野与 Soul 为灵感打造的 AI 恋爱软件。在这个充满奇幻色彩的虚拟恋爱空间中，用户将开启一场跨越星空与灵魂的浪漫之旅。它为渴望爱、追寻独特情感体验的用户，构建起一座通往理想恋爱的桥梁，让爱在科技与梦幻的交织中绽放。';
  int number = 1;  // '1为主界面，2为登录，3为注册'
}

class HomePage extends StatelessWidget {
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
        child: GestureDetector(
          onTap: () {
            // 点击时跳转到登录页
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
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
            child: Center(
              // 主界面 & 登录 & 注册
              child: githome(initialData),
            ),
          ),
        ),
      ),
    ),
  );
}
  // 主界面
  Widget githome(InitialData initialData){
    return Column(
      children: [
        Container(
          width: 560,
          height: 850,
          child: Stack(
            children: [
              Positioned(
                left: 63,
                top: 82,
                child: SizedBox(
                  width: 497,
                  height: 280,
                  child: Text(
                    '心动瞬间',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 64,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 28,
                top: 223,
                child: SizedBox(
                  width: 341,
                  height: 157,
                  child: Text(
                    '“星野恋曲” 是一款以星野与 Soul 为灵感打造的 AI 恋爱软件。在这个充满奇幻色彩的虚拟恋爱空间中，用户将开启一场跨越星空与灵魂的浪漫之旅。它为渴望爱、追寻独特情感体验的用户，构建起一座通往理想恋爱的桥梁，让爱在科技与梦幻的交织中绽放。',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 78,
                top: 786,
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 47,
                  height: 47,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 125,
                top: 786,
                child: SizedBox(
                  width: 202,
                  height: 64,
                  child: Text(
                    '点击任意一处进入',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 12,
                top: 17,
                child: GestureDetector(
                  onTap: () {
                    // 点击时执行跳转逻辑
                    Navigator.of(_context).push(
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: SizedBox(
                    width: 30,
                    height: 20,
                    child: Text(
                      '登录',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
 
}