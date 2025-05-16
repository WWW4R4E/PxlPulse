// 上方功能栏
import 'package:flutter/material.dart';

class CustomLayoutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300, // 根据需要调整宽度
      height: 100, // 根据需要调整高度
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple, Colors.pink], // 背景渐变色
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        border: Border.all(color: Colors.blue, width: 2), // 边框颜色和宽度
        borderRadius: BorderRadius.circular(5), // 圆角边框
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 子元素之间等间距分布
        children: [
          Square(), // 左侧小方块
          Expanded(
            child: Center(
              child: LargeRectangleWithInput(), // 中间大矩形带输入框
            ),
          ),
          Square(), // 右侧小方块
        ],
      ),
    );
  }
}

class Square extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40, // 方块宽度
      height: 40, // 方块高度
      color: Colors.white, // 方块颜色
    );
  }
}

class LargeRectangleWithInput extends StatefulWidget {
  @override
  _LargeRectangleWithInputState createState() => _LargeRectangleWithInputState();
}

class _LargeRectangleWithInputState extends State<LargeRectangleWithInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose(); // 清理控制器
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120, // 大矩形宽度
      height: 60, // 大矩形高度
      color: Colors.white, // 大矩形颜色
      child: Row(
        children: [
          Expanded(child: Container()), // 空白部分
          Container(
            width: 80, // 输入框容器宽度
            height: 40, // 输入框容器高度
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.grey[300], // 输入框背景颜色
              borderRadius: BorderRadius.circular(5), // 圆角边框
            ),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: InputBorder.none, // 去除默认边框
                hintText: '输入内容', // 提示文字
              ),
            ),
          ),
        ],
      ),
    );
  }
}