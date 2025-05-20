import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/friends_page/friends_list.dart';

class FriendPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('好友列表'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FriendsList(), // 使用你的 FriendsList 组件
      ),
    );
  }
}