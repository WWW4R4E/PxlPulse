// 选择与开始互动
// “选择此角色” 按钮，确定后显示交互框支持用户将语句输送到后端，随后后端返回音频与文字进行展示 
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:lottie/lottie.dart';
import '../../services/api_service.dart';

class CharacterInteractionPage extends StatefulWidget {
  final String characterId;
  final String characterName;

  CharacterInteractionPage({required this.characterId, required this.characterName});

  @override
  _CharacterInteractionPageState createState() => _CharacterInteractionPageState();
}

class _CharacterInteractionPageState extends State<CharacterInteractionPage> {
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 393,
          height: 531,
          decoration: BoxDecoration(color: const Color(0xFFF5F0E6)),
          Column(
            // 对话框
            children: [
              dialogue(null);
            ]
            // 输入框

          )

        ),
      ],
    );
  }


  // 对话框
  Widget dialogue(String context) {
    return Column(
      children: [
        Container(
          width: 71,
          height: 71,
          decoration: ShapeDecoration(
            image: DecorationImage(
              image: NetworkImage("https://placehold.co/71x71"),
              fit: BoxFit.cover,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35.50),
            ),
          ),
        ),
        Container(
          width: 267,
          height: 102,
          decoration: BoxDecoration(color: const Color(0x7AD9D9D9)),
        ),
        SizedBox(
          width: 205,
          height: 69,
          child: Text(
            context,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }

  // 输入框
  Widget inputBox(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 393,
          height: 150,
          decoration: BoxDecoration(color: const Color(0x7AD9D9D9)),
          child: TextField(
            controller: _messageController, // 使用控制器管理输入内容
            maxLines: null, // 允许多行输入
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(16),
              hintText: '请输入消息',
            ),
          ),
        ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: () async {
            final message = _messageController.text.trim(); // 获取输入框内容
            if (message.isNotEmpty) {
              try {
                final response = await apiService.sendButtonDescription(message);
                
                setState(() {
                  dialogue(response); // 保存后端返回的数据
                  _messageController.clear(); // 清空输入框
                });
              } catch (e) {
                setState(() {
                  backendResponse = 'Error: $e'; // 保存错误信息
                });
              }
            }
          },
          child: Container(
            width: 76,
            height: 33,
            decoration: ShapeDecoration(
              color: const Color(0xFFD9D9D9),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: Center(
              child: Text(
                '发送',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

  