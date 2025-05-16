// character_interaction_area.dart
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter_application_1/common/api/api_service.dart';

class CharacterInteractionArea extends StatefulWidget {
  final String characterId;
  final String characterName;

  const CharacterInteractionArea({
    Key? key,
    required this.characterId,
    required this.characterName,
  }) : super(key: key);

  @override
  _CharacterInteractionAreaState createState() => _CharacterInteractionAreaState();
}

class _CharacterInteractionAreaState extends State<CharacterInteractionArea> {
  late TextEditingController _messageController;
  late FlutterTts flutterTts;
  late ApiService apiService;

  List<Map<String, String>> conversation = [];

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
    flutterTts = FlutterTts();
    apiService = ApiService();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _sendMessage(String message) async {
    if (message.trim().isEmpty) return;

    // 添加用户发送的消息到对话列表
    setState(() {
      conversation.add({'user': message});
    });

    _messageController.clear();

    try {
      final response = await apiService.sendButtonDescription(message);
      await flutterTts.speak(response);

      // 添加机器人回复的消息到对话列表
      setState(() {
        conversation.add({'bot': response});
      });
    } catch (e) {
      // 在对话列表中添加错误提示信息，作为机器人的回复
      setState(() {
        conversation.add({
          'bot': '请确定当前网络状态，再稍后重试!',
        });
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 对话历史区域
        Expanded(
          child: ListView.builder(
            itemCount: conversation.length,
            itemBuilder: (context, index) {
              final item = conversation[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (item.containsKey('user'))
                      Container(
                        padding: EdgeInsets.all(12),
                        margin: EdgeInsets.only(bottom: 4),
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(item['user']!),
                      ),
                    if (item.containsKey('bot'))
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(child: Icon(Icons.person)),
                          SizedBox(width: 8),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(item['bot']!),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              );
            },
          ),
        ),

        // 输入框和发送按钮
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: Colors.grey[200],
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _messageController,
                  decoration: InputDecoration(
                    hintText: "输入消息...",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  final msg = _messageController.text;
                  if (msg.isNotEmpty) {
                    _sendMessage(msg);
                  }
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}