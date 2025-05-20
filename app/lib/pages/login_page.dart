import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/login_page/login.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/pages/home_page.dart';

class InitialData {
  String titleName = '心动瞬间';
  String conterSpan =
      '“星野恋曲”是一款以星野与 Soul 为灵感打造的 AI 恋爱软件。在这个充满奇幻色彩的虚拟恋爱空间中，用户将开启一场跨越星空与灵魂的浪漫之旅。它为渴望爱、追寻独特情感体验的用户，构建起一座通往理想恋爱的桥梁，让爱在科技与梦幻的交织中绽放。';
  int number = 1; // 1为主界面，2为登录，3为注册
}

class HomePage extends StatelessWidget {
  final InitialData initialData = InitialData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MainPage()), // 跳转到 Main 页面
          );
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF1A237E), Color(0xFFFF7EB9)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraints.maxHeight),
                    child: githome(initialData, context),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget githome(InitialData data, BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Container(
          width: screenWidth * 0.9, // 宽度设为屏幕宽度的90%
          height: screenHeight * 0.9, // 高度设为屏幕高度的90%
          child: Stack(
            children: [
              // 标题文字 - 心动瞬间
              Positioned(
                left: screenWidth * 0.1,
                top: screenHeight * 0.1,
                child: SizedBox(
                  width: screenWidth * 0.7,
                  height: screenHeight * 0.15,
                  child: Text(
                    '心动瞬间',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenHeight * 0.06, // 字体大小按屏幕高度比例
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),

              // 描述文本
              Positioned(
                left: screenWidth * 0.05,
                top: screenHeight * 0.25,
                child: SizedBox(
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.2,
                  child: Text(
                    data.conterSpan,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenHeight * 0.022,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),

              // 小圆点1
              Positioned(
                left: screenWidth * 0.14,
                top: screenHeight * 0.85,
                child: Container(
                  width: screenHeight * 0.025,
                  height: screenHeight * 0.025,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: CircleBorder(),
                  ),
                ),
              ),

              // 点击进入提示文字
              Positioned(
                left: screenWidth * 0.23,
                top: screenHeight * 0.85,
                child: SizedBox(
                  width: screenWidth * 0.4,
                  height: screenHeight * 0.07,
                  child: Center(
                    child: Text(
                      '点击任意一处进入',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),

              // 登录按钮
              Positioned(
                left: screenWidth * 0.02, // 调整left值使按钮位于屏幕左上角附近
                top: screenHeight * 0.02,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => LoginPage()),
                    );
                  },
                  child: Container( // 使用Container作为按钮的容器
                    width: screenWidth * 0.12, // 调整宽度以适应你的设计
                    height: screenHeight * 0.05, // 调整高度以适应你的设计
                    decoration: BoxDecoration(
                      color: Colors.transparent, // 设置按钮背景颜色为透明
                      border: Border.all(color: Colors.white, width: 1), // 添加白色边框
                      borderRadius: BorderRadius.circular(8), // 可选：设置圆角
                    ),
                    child: Center(
                      child: Text(
                        '登录',
                        style: TextStyle(
                          color: Colors.white, // 文本颜色设置为白色以便于对比背景颜色
                          fontSize: screenHeight * 0.02, // 根据屏幕大小调整字体大小
                          fontWeight: FontWeight.w700,
                        ),
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