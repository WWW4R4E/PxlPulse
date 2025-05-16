import 'dart:convert';

import 'package:http/http.dart' as http;

class MessageApi {
  static const String baseUrl = 'http://localhost:5180/api';

  Future<dynamic> sendNotification({
    required String sessionId,
    required String text,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/Message/send'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'sessionId': sessionId,
        'text': text,
      }),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to send notification');
    }
  }

  Future<dynamic> readNotification(int notificationId) async {
    final response = await http.post(
      Uri.parse('$baseUrl/User/notifications/$notificationId/read'),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to read notification');
    }
  }

  Future<dynamic> getMessageSession(String sessionId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/Message/session/$sessionId'),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get message session');
    }
  }
}
