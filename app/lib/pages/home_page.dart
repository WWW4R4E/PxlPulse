// home_all_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/ai_character_selection_page&home_page/interactive_preview.dart';

class ChatMessage {
  final String avatarUrl;
  final String message;
  final DateTime timestamp;
  final bool isMe;

  ChatMessage({
    required this.avatarUrl,
    required this.message,
    required this.timestamp,
    required this.isMe,
  });
}

class HomeAllPage extends StatefulWidget {
  @override
  _HomeAllPageState createState() => _HomeAllPageState();
}

class _HomeAllPageState extends State<HomeAllPage> {
  final List<ChatMessage> _messages = [
    ChatMessage(
      avatarUrl: 'https://placehold.co/100x100',
      message: '你好！',
      timestamp: DateTime.now().subtract(const Duration(minutes: 10)),
      isMe: false,
    ),
    ChatMessage(
      avatarUrl: 'https://placehold.co/100x100',
      message: '你好，很高兴见到你！',
      timestamp: DateTime.now().subtract(const Duration(minutes: 9)),
      isMe: true,
    ),
    ChatMessage(
      avatarUrl: 'https://placehold.co/100x100',
      message: '今天的天气怎么样？',
      timestamp: DateTime.now().subtract(const Duration(minutes: 8)),
      isMe: false,
    ),
    ChatMessage(
      avatarUrl: 'https://placehold.co/100x100',
      message: '今天天气很好，阳光明媚。',
      timestamp: DateTime.now().subtract(const Duration(minutes: 7)),
      isMe: true,
    ),
    ChatMessage(
      avatarUrl: 'https://placehold.co/100x100',
      message: '你有什么计划吗？',
      timestamp: DateTime.now().subtract(const Duration(minutes: 6)),
      isMe: false,
    ),
    ChatMessage(
      avatarUrl: 'https://placehold.co/100x100',
      message: '我打算去公园散步。',
      timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
      isMe: true,
    ),
    ChatMessage(
      avatarUrl: 'https://placehold.co/100x100',
      message: '听起来不错！',
      timestamp: DateTime.now().subtract(const Duration(minutes: 4)),
      isMe: false,
    ),
    ChatMessage(
      avatarUrl: 'https://placehold.co/100x100',
      message: '要一起去吗？',
      timestamp: DateTime.now().subtract(const Duration(minutes: 3)),
      isMe: true,
    ),
    ChatMessage(
      avatarUrl: 'https://placehold.co/100x100',
      message: '好啊，我很乐意！',
      timestamp: DateTime.now().subtract(const Duration(minutes: 2)),
      isMe: false,
    ),
    ChatMessage(
      avatarUrl: 'https://placehold.co/100x100',
      message: '那我们下午2点见？',
      timestamp: DateTime.now().subtract(const Duration(minutes: 1)),
      isMe: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // 添加这一行
        child: Column(
          children: [
            // 角色介绍和按钮区域
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4, // 可选：手动指定高度
              child: InteractivePreview(
                characterId: 3,
                description: Container(
                  margin: EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Text('这是一个描述'),
                ),
                button: [
                  KeySentence(
                      buttonname: '按钮1', buttondescription: '这是第一个按钮的说明'),
                  KeySentence(
                      buttonname: '按钮2', buttondescription: '这是第二个按钮的说明'),
                  KeySentence(
                      buttonname: '按钮3', buttondescription: '这是第三个按钮的说明'),
                  KeySentence(
                      buttonname: '按钮4', buttondescription: '这是第四个按钮的说明'),
                  KeySentence(
                      buttonname: '按钮5', buttondescription: '这是第五个按钮的说明'),
                  KeySentence(
                      buttonname: '按钮6', buttondescription: '这是第六个按钮的说明'),
                  KeySentence(
                      buttonname: '按钮7', buttondescription: '这是第七个按钮的说明'),
                  KeySentence(
                      buttonname: '按钮8', buttondescription: '这是第八个按钮的说明'),
                ],
              ),
            ),
            // 互动聊天区域
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    final message = _messages[index];
                    return Align(
                      alignment: message.isMe
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: message.isMe
                              ? Colors.blue[100]
                              : Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (!message.isMe)
                              CircleAvatar(
                                backgroundImage:
                                    NetworkImage(message.avatarUrl),
                              ),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  message.message,
                                  style: const TextStyle(fontSize: 14),
                                ),
                                Text(
                                  '${message.timestamp.hour}:${message.timestamp.minute}',
                                  style: const TextStyle(
                                      fontSize: 10, color: Colors.grey),
                                ),
                              ],
                            ),
                            if (message.isMe) const SizedBox(width: 8),
                            if (message.isMe)
                              CircleAvatar(
                                backgroundImage:
                                    NetworkImage(message.avatarUrl),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // 示例聊天记录

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: '输入消息...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.send, color: Colors.white),
                        onPressed: () {
                          // 发送消息逻辑
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
