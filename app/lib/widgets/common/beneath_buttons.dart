// 下方功能栏
import 'package:flutter/material.dart';

class CustomSquaresWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300, // 根据需要调整宽度
      height: 100, // 根据需要调整高度
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple, Colors.pink], // 背景渐变色
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(8), // 圆角边框
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 方块之间等间距分布
        children: List.generate(4, (_) => Square()), // 创建4个相同的方块
      ),
    );
  }
}

class Square extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50, // 方块宽度
      height: 50, // 方块高度
      color: Colors.white, // 方块颜色
      margin: EdgeInsets.all(8), // 方块之间的间距
    );
  }
}
