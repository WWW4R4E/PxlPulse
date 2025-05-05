import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: '请输入用户名',
                labelText: '用户名',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: '请输入密码',
                labelText: '密码',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // 登录逻辑
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              child: Text('登录'),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // 跳转到注册页面
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterPage(),
                  ),
                );
              },
              child: Text('还没有账号？立即注册'),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('注册'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: '请输入用户名',
                labelText: '用户名',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: '请输入邮箱',
                labelText: '邮箱',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: '请输入密码',
                labelText: '密码',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // 注册逻辑
              },
              child: Text('注册'),
            ),
          ],
        ),
      ),
    );
  }
}