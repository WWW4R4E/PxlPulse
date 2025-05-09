// 互动预览区
// 预设对话场景按钮（问候、约会等），点击后角色动画、语音台词展示
import 'package:flutter/material.dart';
import '../../services/api_service.dart';

// 关键句类
class KeySentence{
  final String buttonname;
  final String buttondescription;
  KeySentence({
    required this.buttonname,
    required this.buttondescription
  });
}

class InteractivePreview extends StatefulWidget {
  final String characterId;
  final String description;
  final List<KeySentence> button;

  InteractivePreview({
    required this.characterId,
    required this.description,
    required this.button,
  });

  @override
  _InteractivePreviewState createState() => _InteractivePreviewState();
}

class _InteractivePreviewState extends State<InteractivePreview> with SingleTickerProviderStateMixin {
  late ApiService apiService = ApiService();
  late InteractivePreview interactivePreview;
  late String backendResponse = '';

  @override
  void initState() {
    super.initState();
    interactivePreview = apiService.getaidescription();
  }


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('互动预览'),
      ), body: Center(
        child: Column(
           children: [
            // 介绍ai背景
            description(context),
            buttons(context)
            // 按钮排序
           ]
        )
      )
    );
  }

  //介绍板
  Widget description(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 351,
          height: 150,
          decoration: ShapeDecoration(
            color: const Color(0x7AD9D9D9),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1),
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
        SizedBox(
          width: 301,
          height: 111,
          child: Text(
            interactivePreview.description,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }

  // 按钮集合
  Widget buttons(BuildContext context) {
    return Column(
       children: [
          Row(
            children: [
              button(interactivePreview.button[0]),
              button(interactivePreview.button[1]),
              button(interactivePreview.button[2]),
              button(interactivePreview.button[3]),
            ]
          ),
          Row(
            children: [
              button(interactivePreview.button[4]),
              button(interactivePreview.button[5]),
              button(interactivePreview.button[6]),
              button(interactivePreview.button[7]),
            ]
          )
       ]
    );
  }

  //按钮
  Widget button(KeySentence button) {
    return Column(
      children: [
        SizedBox(
          width: 43,
          height: 14,
          child: Text(
            button.buttonname,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            try {
              final response = await apiService.sendButtonDescription(button.buttondescription);
              setState(() {
                backendResponse = response; // 保存后端返回的数据
              });
            } catch (e) {
              setState(() {
                backendResponse = 'Error: $e'; // 保存错误信息
              });
            }
          },
          child: Container(
            width: 71,
            height: 40,
            decoration: ShapeDecoration(
              color: const Color(0x7AD9D9D9),
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }
}