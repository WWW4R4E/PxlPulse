import 'package:flutter/material.dart';

class LoveInteractionPage extends StatelessWidget {
  final int characterId;

  LoveInteractionPage({required this.characterId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('与 AI 角色互动'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text('互动记录 1'),
                  subtitle: Text('互动时间：2024-10-01 10:00'),
                ),
                ListTile(
                  title: Text('互动记录 2'),
                  subtitle: Text('互动时间：2024-10-02 14:30'),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                hintText: '输入互动内容...',
              ),
              onSubmitted: (value) {
                // 发送互动内容的逻辑
              },
            ),
          ),
        ],
      ),
    );
  }
}