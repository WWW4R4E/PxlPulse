// 互动预览区
// 预设对话场景按钮（问候、约会等），点击后角色动画、语音台词展示
import 'package:flutter/material.dart';
import '../../services/api_service.dart';

// 关键句类
class KeySentence {
  final String buttonname;
  final String buttondescription;

  KeySentence({
    required this.buttonname,
    required this.buttondescription,
  });
}

class InteractivePreview extends StatefulWidget {
  final int characterId;
  final String description;
  final List<KeySentence> button;

  const InteractivePreview({
    Key? key,
    required this.characterId,
    required this.description,
    required this.button,
  }) : super(key: key);

  @override
  _InteractivePreviewState createState() => _InteractivePreviewState();
}

class _InteractivePreviewState extends State<InteractivePreview>
    with SingleTickerProviderStateMixin {
  late ApiService apiService = ApiService();
  late Future<String> backendResponse;

  @override
  void initState() {
    super.initState();
    // 初始化时加载描述信息
    backendResponse = apiService.getaidescription(widget.characterId) as Future<String>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('互动预览'),
      ),
      body: Center(
        child: Column(
          children: [
            // 介绍AI背景
            description(context),
            buttons(context),
            // 显示后端响应
            FutureBuilder<String>(
              future: backendResponse,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text('后端响应: ${snapshot.data}');
                } else if (snapshot.hasError) {
                  return Text('错误: ${snapshot.error}');
                }
                return CircularProgressIndicator(); // 加载中
              },
            )
          ],
        ),
      ),
    );
  }

  // 介绍板
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
            widget.description,
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (widget.button.length > 0) button(widget.button[0]),
            if (widget.button.length > 1) button(widget.button[1]),
            if (widget.button.length > 2) button(widget.button[2]),
            if (widget.button.length > 3) button(widget.button[3]),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (widget.button.length > 4) button(widget.button[4]),
            if (widget.button.length > 5) button(widget.button[5]),
            if (widget.button.length > 6) button(widget.button[6]),
            if (widget.button.length > 7) button(widget.button[7]),
          ],
        ),
      ],
    );
  }

  // 按钮
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
                backendResponse = Future.value(response); // 更新后端返回的数据
              });
            } catch (e) {
              setState(() {
                backendResponse = Future.value('Error: $e'); // 更新错误信息
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