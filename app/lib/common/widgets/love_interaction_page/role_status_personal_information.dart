// 角色状态与个人信息
// 顶部角色头像、昵称、心情、亲密度，用户个人中心入口。 
import 'package:flutter/material.dart';

class CharacterStatusAndPersonalInfo extends StatelessWidget {
  final String characterImage;
  final String characterName;
  final String characterMood;
  final int characterIntimacy;
  final VoidCallback onPersonalInfoTap;

  CharacterStatusAndPersonalInfo({
    required this.characterImage,
    required this.characterName,
    required this.characterMood,
    required this.characterIntimacy,
    required this.onPersonalInfoTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          // 角色头像
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(characterImage),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // 角色昵称
                Text(
                  characterName,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                // 角色心情
                Text(
                  '心情：$characterMood',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(height: 4),
                // 角色亲密度
                Text(
                  '亲密度：$characterIntimacy',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          // 用户个人中心入口
          IconButton(
            icon: Icon(Icons.person),
            onPressed: onPersonalInfoTap,
          ),
        ],
      ),
    );
  }
}