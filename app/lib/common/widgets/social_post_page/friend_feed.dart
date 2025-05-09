// 好友动态区
// 信息流展示动态（头像、昵称、内容、图片、互动按钮）。 
import 'package:flutter/material.dart';

class FriendDynamicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('好友动态'),
      ),
      body: ListView.builder(
        itemCount: 10, // 假设有10条动态
        itemBuilder: (context, index) {
          return _buildDynamicItem(context, index);
        },
      ),
    );
  }

  Widget _buildDynamicItem(BuildContext context, int index) {
    // 模拟动态数据
    final dynamicData = _getDynamicData(index);

    return Card(
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 头像和昵称
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(dynamicData['avatar']),
            ),
            title: Text(dynamicData['nickname']),
            subtitle: Text(dynamicData['time']),
          ),
          // 动态内容
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              dynamicData['content'],
              style: TextStyle(fontSize: 16),
            ),
          ),
          // 动态图片
          if (dynamicData['image'] != null)
            Image.network(
              dynamicData['image'],
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          // 互动按钮
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildInteractionButton(Icons.favorite_border, '点赞'),
                _buildInteractionButton(Icons.comment, '评论'),
                _buildInteractionButton(Icons.share, '分享'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInteractionButton(IconData icon, String label) {
    return InkWell(
      onTap: () {
        // 点击互动按钮的逻辑
        print('点击了 $label');
      },
      child: Row(
        children: [
          Icon(icon, size: 20),
          SizedBox(width: 4),
          Text(label),
        ],
      ),
    );
  }

  Map<String, dynamic> _getDynamicData(int index) {
    // 模拟动态数据
    return {
      'avatar': 'https://via.placeholder.com/150', // 示例头像
      'nickname': '用户$index',
      'time': '2025-05-08 14:30',
      'content': '这是第$index条动态的内容，可以包含文字描述等信息。',
      'image': index % 2 == 0 ? 'https://via.placeholder.com/600x400' : null, // 每隔一条动态添加图片
    };
  }
}