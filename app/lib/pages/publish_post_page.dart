// # 通用页面组件（如添加日记、发布动态等）
import 'package:flutter/material.dart';

class SocialPostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('社交动态'),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage('用户头像链接'),
                  ),
                  title: Text('用户名'),
                  subtitle: Text('发布时间：2024-10-01 10:00'),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('动态内容'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text('点赞：10'),
                    Text('评论：5'),
                    Text('分享：3'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PublishPostPage(),
            ),
          );
        },
        child: Icon(Icons.create),
      ),
    );
  }
}

class PublishPostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('发布动态'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Expanded(
              child: TextField(
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  hintText: '输入动态内容...',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // 发布动态的逻辑
              },
              child: Text('发布'),
            ),
          ],
        ),
      ),
    );
  }
}