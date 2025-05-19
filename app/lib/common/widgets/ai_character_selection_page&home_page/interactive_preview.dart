// 互动预览区
// 预设对话场景按钮（问候、约会等），点击后角色动画、语音台词展示
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/api/character_api.dart';
import '../../api/api_service.dart';

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

class _InteractivePreviewState extends State<InteractivePreview> {
  var homeData = null;
  ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    homeData = await CharacterApi().getAiDescription(0);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: homeData == null
            ? CircularProgressIndicator()
            : Column(
                children: [
                  gitintrodect(),
                  gitbuttons(),
                ],
              ),
      ),
    );
  }

  Widget gitintrodect(){
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Text(
        homeData.description,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget gitbuttons(){
    if (homeData.button.length < 4) {
      return SizedBox.shrink();
    }
    return Column(
      children: [
        button(homeData.button.sublist(0, 4)),
        SizedBox(height: 20),
        if (homeData.button.length > 4)
          button(homeData.button.sublist(4, 8)),
      ],
    );
  }

  Widget button(List<KeySentence> buttons){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: buttons.map((button) {
        return FractionallySizedBox(
     
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: ElevatedButton(
              onPressed: () {
                apiService.sendButtonDescription(button.buttondescription);
              },
              child: Text(button.buttonname),
            ),
          ),
        );
      }).toList(),
    );
  }
}
