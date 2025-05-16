// home_all_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/ai_character_selection_page&home_page/interactive_preview.dart';
import 'package:flutter_application_1/common/widgets/ai_character_selection_page&home_page/select_start_interact_with.dart';


class HomeAllPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("角色互动主页")),
      body: Column(
        children: [
          // 角色介绍和按钮区域
          Expanded(
            flex: 2,
            child: InteractivePreview(
              characterId: 3,
              description: '这是一个描述',
              button: [
                KeySentence(buttonname: '按钮1', buttondescription: '这是第一个按钮的说明'),
                KeySentence(buttonname: '按钮2', buttondescription: '这是第二个按钮的说明'),
                KeySentence(buttonname: '按钮3', buttondescription: '这是第三个按钮的说明'),
                KeySentence(buttonname: '按钮4', buttondescription: '这是第四个按钮的说明'),
                KeySentence(buttonname: '按钮5', buttondescription: '这是第五个按钮的说明'),
                KeySentence(buttonname: '按钮6', buttondescription: '这是第六个按钮的说明'),
                KeySentence(buttonname: '按钮7', buttondescription: '这是第七个按钮的说明'),
                KeySentence(buttonname: '按钮8', buttondescription: '这是第八个按钮的说明'),
              ],
            ),
          ),

          Divider(height: 1),

          // 互动聊天区域
          Expanded(
            flex: 5,
            child: CharacterInteractionArea(characterId: '3', characterName: '角色名字'),
          ),
        ],
      ),
    );
  }
}