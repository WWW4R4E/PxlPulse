import 'auth_api.dart';
import 'character_api.dart';
import 'diary_api.dart';
import 'message_api.dart';
import 'user_api.dart';
import 'voice_api.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();

  factory ApiClient() {
    return _instance;
  }

  ApiClient._internal();

  final authApi = AuthApi();
  final userApi = UserApi();
  final messageApi = MessageApi();
  final voiceApi = VoiceApi();
  final characterApi = CharacterApi();
  final diaryApi = DiaryApi();

  static const String baseUrl = 'http://localhost:5180/api';
}
