import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/login_page/register.dart'; // 确保这个路径正确
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter/services.dart'; 

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: gitlogin(context),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 登录
  Widget gitlogin(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 274,
          height: 267,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(31),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '心动瞬间',
                  style: TextStyle(
                    color: const Color(0xFF1A237E),
                    fontSize: 40,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  keyboardType: TextInputType.number, // 设置键盘类型为数字键盘
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly], // 只允许输入数字
                  decoration: InputDecoration(
                    labelText: '账号：',
                    labelStyle: TextStyle(
                      color: const Color(0xFF1A237E),
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                    ),
                    filled: true,
                    fillColor: const Color(0xFFD9D9D9),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: '密码：',
                    labelStyle: TextStyle(
                      color: const Color(0xFF1A237E),
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                    ),
                    filled: true,
                    fillColor: const Color(0xFFD9D9D9),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      '如果您没有账号，请点击',
                      style: TextStyle(
                        color: const Color(0xFFFF7EB9),
                        fontSize: 13,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // 跳转到注册页面
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterPage()),
                        );
                      },
                      child: Text(
                        '此处',
                        style: TextStyle(
                          color: const Color(0xFF0E36FF),
                          fontSize: 13,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      '注册',
                      style: TextStyle(
                        color: const Color(0xFFFF7EB9),
                        fontSize: 13,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}