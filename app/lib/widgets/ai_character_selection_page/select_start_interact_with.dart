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

    );
  }
}

  