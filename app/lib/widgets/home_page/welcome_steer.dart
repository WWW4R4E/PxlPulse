// 欢迎引导区
// 主题插画展示、欢迎语 “欢迎来到星野恋曲”、 “开始恋爱” 入口按钮。
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/welcome_image.png', // 替换为你的主题插画路径
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              '欢迎来到星野恋曲',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // 跳转到主页
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              child: Text('开始恋爱'),
              style: ElevatedButton.styleFrom(
                primary: Colors.pink, // 按钮颜色
                onPrimary: Colors.white, // 文字颜色
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}