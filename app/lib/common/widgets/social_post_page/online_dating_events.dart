// 线上约会活动区
// 活动信息展示（主题、时间、方式、奖品），报名功能。 
import 'package:flutter/material.dart';

class OnlineDateEventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('线上约会活动区'),
      ),
      body: ListView.builder(
        itemCount: 5, // 假设有5个活动
        itemBuilder: (context, index) {
          return _buildEventItem(context, index);
        },
      ),
    );
  }

  Widget _buildEventItem(BuildContext context, int index) {
    // 模拟活动数据
    final eventData = _getEventData(index);

    return Card(
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 活动主题
          ListTile(
            title: Text(
              eventData['theme'],
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(eventData['time']),
          ),
          // 活动方式
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '活动方式：${eventData['method']}',
              style: TextStyle(fontSize: 16),
            ),
          ),
          // 活动奖品
          if (eventData['prize'] != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '奖品：${eventData['prize']}',
                style: TextStyle(fontSize: 16),
              ),
            ),
          // 报名按钮
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // 报名逻辑
                _showRegistrationDialog(context, eventData['theme']);
              },
              child: Text('立即报名'),
            ),
          ),
        ],
      ),
    );
  }

  void _showRegistrationDialog(BuildContext context, String theme) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('确认报名'),
          content: Text('您即将报名参加活动：$theme'),
          actions: [
            TextButton(
              onPressed: () {
                // 取消报名
                Navigator.pop(context);
              },
              child: Text('取消'),
            ),
            ElevatedButton(
              onPressed: () {
                // 确认报名
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('报名成功！')),
                );
                Navigator.pop(context);
              },
              child: Text('确认'),
            ),
          ],
        );
      },
    );
  }

  Map<String, dynamic> _getEventData(int index) {
    // 模拟活动数据
    return {
      'theme': '活动$index：浪漫线上约会',
      'time': '2025年05月${index + 10}日 20:00',
      'method': '线上视频会议',
      'prize': index % 2 == 0 ? '精美礼品一份' : null, // 每隔一个活动有奖品
    };
  }
}