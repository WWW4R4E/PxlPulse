import 'package:flutter/material.dart';
import 'love_interaction_page.dart';

class AICharacterSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('选择 AI 角色'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('星野'),
            subtitle: Text('性格：温柔热情'),
            leading: Image.network('星野角色图片链接'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoveInteractionPage(characterId: 1),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Soul'),
            subtitle: Text('性格：冷静沉稳'),
            leading: Image.network('Soul角色图片链接'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoveInteractionPage(characterId: 2),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}