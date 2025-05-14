// 初始页面
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/login_page/initial.dart';
import 'package:flutter_application_1/common/widgets/login_page/register.dart';
import 'package:flutter_application_1/pages/home_page.dart';



class LoginPage extends StatelessWidget {
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
                child: gitlogin(initialData),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 登录
  Widget gitlogin(InitialData initialData){
    return Column(
      children: [
        Container(
          width: 550,
          height: 302.25,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 35.25,
                child: Container(
                  width: 274,
                  height: 267,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(31),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 53,
                top: 16,
                child: SizedBox(
                  width: 497,
                  height: 62,
                  child: Text(
                    '心动瞬间',
                    style: TextStyle(
                      color: const Color(0xFF1A237E),
                      fontSize: 40,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 12,
                top: 122,
                child: SizedBox(
                  width: 222,
                  height: 34,
                  child: Text(
                    '账号：',
                    style: TextStyle(
                      color: const Color(0xFF1A237E),
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 12,
                top: 174,
                child: SizedBox(
                  width: 235,
                  height: 36,
                  child: Text(
                    '密码：',
                    style: TextStyle(
                      color: const Color(0xFF1A237E),
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 72,
                top: 118,
                child: Container(
                  width: 175,
                  height: 30,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFD9D9D9),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  ),
                ),
              ),
              Positioned(
                left: 72,
                top: 169,
                child: Container(
                  width: 175,
                  height: 30,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFD9D9D9),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                  ),
                ),
              ),
              Positioned(
                left: 32,
                top: 282,
                child: SizedBox(
                  width: 219,
                  height: 20,
                  child: Text(
                    '如果您没有账号，请点击         注册  ',
                    style: TextStyle(
                      color: const Color(0xFFFF7EB9),
                      fontSize: 13,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 177,
                top: 282,
                child: SizedBox(
                  width: 219,
                  height: 20,
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
              ),
            ],
          ),
        ),
      ],
    );
  }
}