// 恋爱任务与剧情推进
// 侧边栏任务列表（卡片式）、任务详情窗口（目标、奖励、行动按钮）。 
import 'package:flutter/material.dart';

class LoveTaskPage extends StatefulWidget {
  @override
  _LoveTaskPageState createState() => _LoveTaskPageState();
}

class _LoveTaskPageState extends State<LoveTaskPage> {
  // 示例任务数据
  final List<Map<String, dynamic>> tasks = [
    {
      'title': '任务 1',
      'description': '完成任务 1 的描述',
      'reward': '奖励 1',
    },
    {
      'title': '任务 2',
      'description': '完成任务 2 的描述',
      'reward': '奖励 2',
    },
    {
      'title': '任务 3',
      'description': '完成任务 3 的描述',
      'reward': '奖励 3',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('恋爱任务与剧情推进'),
      ),
      body: Row(
        children: <Widget>[
          // 侧边栏任务列表
          Expanded(
            flex: 2,
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(tasks[index]['title']),
                    subtitle: Text(tasks[index]['description']),
                    onTap: () {
                      // 显示任务详情窗口
                      _showTaskDetails(tasks[index]);
                    },
                  ),
                );
              },
            ),
          ),
          // 任务详情窗口
          Expanded(
            flex: 3,
            child: Center(
              child: Text('点击任务卡片查看详细信息'),
            ),
          ),
        ],
      ),
    );
  }

  void _showTaskDetails(Map<String, dynamic> task) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(task['title']),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('目标：${task['description']}'),
              SizedBox(height: 20),
              Text('奖励：${task['reward']}'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('接受任务'),
              onPressed: () {
                // 处理接受任务的逻辑
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('放弃任务'),
              onPressed: () {
                // 处理放弃任务的逻辑
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}