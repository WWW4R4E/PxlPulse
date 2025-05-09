// 话题讨论区
// 热门与自定义话题卡片，包含名称、发起人、参与人数、回复时间。
import 'package:flutter/material.dart';

class TopicDiscussionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('话题讨论区'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '热门话题',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            _buildTopicList(context, isHot: true),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '自定义话题',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            _buildTopicList(context, isHot: false),
          ],
        ),
      ),
    );
  }

  Widget _buildTopicList(BuildContext context, {required bool isHot}) {
    List<Map<String, dynamic>> topics = isHot ? _getHotTopics() : _getCustomTopics();

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: topics.length,
      itemBuilder: (context, index) {
        return _buildTopicCard(context, topics[index]);
      },
    );
  }

  Widget _buildTopicCard(BuildContext context, Map<String, dynamic> topic) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(
          topic['name'],
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('发起人：${topic['initiator']}'),
            Text('参与人数：${topic['participants']}'),
            Text('最近回复：${topic['lastReply']}'),
          ],
        ),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          // 点击话题卡片的逻辑
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('您点击了话题：${topic['name']}')),
          );
        },
      ),
    );
  }

  List<Map<String, dynamic>> _getHotTopics() {
    // 模拟热门话题数据
    return [
      {
        'name': '话题1：浪漫的线上约会',
        'initiator': '用户A',
        'participants': '120人',
        'lastReply': '2025-05-08 14:30',
      },
      {
        'name': '话题2：如何提升线上互动',
        'initiator': '用户B',
        'participants': '85人',
        'lastReply': '2025-05-07 10:15',
      },
      {
        'name': '话题3：线上约会的技巧',
        'initiator': '用户C',
        'participants': '200人',
        'lastReply': '2025-05-06 18:45',
      },
    ];
  }

  List<Map<String, dynamic>> _getCustomTopics() {
    // 模拟自定义话题数据
    return [
      {
        'name': '话题4：我的线上约会经历',
        'initiator': '用户D',
        'participants': '50人',
        'lastReply': '2025-05-05 12:00',
      },
      {
        'name': '话题5：线上约会的安全问题',
        'initiator': '用户E',
        'participants': '70人',
        'lastReply': '2025-05-04 16:30',
      },
      {
        'name': '话题6：线上约会的礼仪',
        'initiator': '用户F',
        'participants': '60人',
        'lastReply': '2025-05-03 09:15',
      },
    ];
  }
}