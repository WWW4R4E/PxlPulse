// 规则展示
import 'package:flutter/material.dart';

class RuleDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('会员权益'),
        ),
        body: Center(
          child: Container(
            width: 300, // 设置宽度
            height: 150, // 设置高度
            decoration: BoxDecoration(
              color: Colors.white, // 背景颜色为白色
              border: Border.all(
                color: Colors.blue, // 边框颜色为蓝色
                width: 2.0, // 边框宽度为2像素
              ),
              borderRadius: BorderRadius.circular(10.0), // 圆角半径为10像素
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '会员权益',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}