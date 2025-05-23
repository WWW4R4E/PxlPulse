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

    setState(() {
      conversation.add({'user': message});
    });

    _messageController.clear();

    try {
      final response = await apiService.sendButtonDescription(message);
      await flutterTts.speak(response);
      setState(() {
        conversation.add({'bot': response});
      });
    } catch (e) {
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
        Expanded(
          child: ListView.builder(
            itemCount: conversation.length,
            itemBuilder: (context, index) {
              final item = conversation[index];
              final isUserMessage = item.containsKey('user');

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
                  children: [
                    if (!isUserMessage)
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/ai_avatar.png'), // AI's avatar image
                        ),
                      ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isUserMessage ? Colors.blue.withOpacity(0.2) : Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(item.values.first),
                      ),
                    ),
                    if (isUserMessage)
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/user_avatar.png'), // User's avatar image
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: Colors.grey[200],
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: "输入消息...",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {
                  final msg = _messageController.text;
                  if (msg.isNotEmpty) {
                    _sendMessage(msg);
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                child: Text("发送"),
              )
            ],
          ),
        ),
      ],
    );
  }
}