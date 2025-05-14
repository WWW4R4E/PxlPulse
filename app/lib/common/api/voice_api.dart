import 'dart:convert';

import 'package:http/http.dart' as http;

class VoiceApi {
  static const String baseUrl = 'http://localhost:5180/api';

  Future<dynamic> processVoice({
    required String audioFile,
    required String userId,
    required String sessionId,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/Voice/process'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'AudioFile': audioFile,
        'UserId': userId,
        'SessionId': sessionId,
      },
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to process voice');
    }
  }
}
