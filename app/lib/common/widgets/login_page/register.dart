// 初始页面
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/login_page/initial.dart';
import 'package:flutter_application_1/pages/home_page.dart';


class RegisterPage extends StatelessWidget {
  InitialData initialData = new InitialData();
  late BuildContext _context;

   @override
  Widget build(BuildContext context) {
    _context = context;
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
                child: gitregister(initialData),
              ),
            ),
          ),
        ),
      ),
    );
  }

    // 注册
  Widget gitregister(InitialData initialData){
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
                left: 19,
                top: 93,
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
                left: 19,
                top: 145,
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
                left: 79,
                top: 89,
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
                left: 79,
                top: 140,
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
                left: 19,
                top: 194,
                child: SizedBox(
                  width: 222,
                  height: 34,
                  child: Text(
                    '手机号：',
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
                left: 19,
                top: 246,
                child: SizedBox(
                  width: 235,
                  height: 36,
                  child: Text(
                    '验证码：',
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
                left: 99,
                top: 190,
                child: Container(
                  width: 155,
                  height: 30,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFD9D9D9),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  ),
                ),
              ),
              Positioned(
                left: 99,
                top: 241,
                child: Container(
                  width: 98,
                  height: 30,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFD9D9D9),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                  ),
                ),
              ),
              Positioned(
                left: 202,
                top: 241,
                child: Container(
                  width: 52,
                  height: 30,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 203,
                top: 251,
                child: SizedBox(
                  width: 63,
                  height: 12,
                  child: Text(
                    '获取验证码',
                    style: TextStyle(
                      color: const Color(0xFF1A237E),
                      fontSize: 10,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                    ),
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
                    '如果您已有账号，请点击         登录  ',
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