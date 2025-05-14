import 'dart:convert';

import 'package:flutter_application_1/common/widgets/ai_character_selection_page&home_page/interactive_preview.dart';
import 'package:flutter_application_1/common/widgets/user_page/record_list.dart';
import 'package:flutter_application_1/common/widgets/user_page/user_title_interaction.dart';
import 'package:flutter_application_1/pages/ai_character_selection_page.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
// 注意：没有注释的接口不用管，那是我熟悉代码用的
class ApiService {
  static const String baseUrl = 'http://localhost:5180/api';
  static final Data _defaultData = Data();


  Future<dynamic> login({required String email, required String password}) async {
    final response = await http.post(
      Uri.parse('$baseUrl/Auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<dynamic> register({
    required String email,
    required String password,
    required String username,
    required String phoneNumber,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/Auth/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'baseRequest': jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
        'username': username,
        'phoneNumber': phoneNumber,
      }),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to register');
    }
  }

  Future<dynamic> getUserProfile() async {
    final response = await http.get(
      Uri.parse('$baseUrl/User/profile'),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get user profile');
    }
  }

  Future<dynamic> updateUserProfile({
    String? username,
    String? email,
    String? phoneNumber,
    String? avatar,
    String? gender,
    String? userType,
    DateTime? birthday,
  }) async {
    final response = await http.patch(
      Uri.parse('$baseUrl/User/profile'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        if (username != null) 'username': username,
        if (email != null) 'email': email,
        if (phoneNumber != null) 'phoneNumber': phoneNumber,
        if (avatar != null) 'avatar': avatar,
        if (gender != null) 'gender': gender,
        if (userType != null) 'userType': userType,
        if (birthday != null) 'birthday': birthday.toIso8601String(),
      }),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to update user profile');
    }
  }

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

  getCharacterInteractions(String characterId) {}

  sendUserInput(String characterId, String userInput) {}

  // 列表查询ai对象（一次12个）
  /** 传入参数 多少个数据
   ** 返回参数 
   *  姓名
   *  图片链接
   *  ai简介
   *  点赞数量
   *  转发数量
   */
  Future<List<Character>> fetchCharacters({int page = 0}) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/characters?page=$page'));
      if (response.statusCode == 200) {
        final List<dynamic> charactersJson = jsonDecode(response.body);
        if (charactersJson.isEmpty) {
          return _defaultData.getDefaultCharacters();
        }
        return charactersJson.map<Character>((json) => Character.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load characters');
      }
    } catch (e) {
      print('Error fetching characters: $e');
      return _defaultData.getDefaultCharacters(); // 返回默认数据
    }
  }


  // 获取ai对象，详细数据
  /**
    *  Id
    *  简介
    *  ai互动能力 ：内含 互动功能名称  互动语言简洁
    */
  InteractivePreview getaidescription(int aiid) {
    return InteractivePreview(characterId: 3, description: '', button: [],);
  }

  // 发送文字获取ai回答
  /**
   * 字符串回答
   */
  String sendButtonDescription(String str){
    return '';
  }

  // 获取用户详细信息
  /**
   * id获取
   * id在userdatadui
   */
  UserData getuserinteraction() {
    return UserData();
  }


  // 获取记录数据
  /**
   * 用户id获取
   * id在userdatadui
   * level 1 == 日记
   * level 2 == 我的ai
   * level 3 == 我的历史浏览  待定
   * level 4 == 我的收藏夹  待定
   */
  List<DiaryData> getdiarydata(int level) {
    return [
    DiaryData(name: '日记1', interaction: '互动信息1'),
    DiaryData(name: '日记2', interaction: '互动信息2'),
    DiaryData(name: '日记3', interaction: '互动信息3'),
    // 可以继续添加更多日记数据...
  ];
  }
}

class Data {
  static final Data _instance = Data._(); // 私有构造函数和单例实例

  factory Data() {
    return _instance;
  }

  Data._() {}

  List<Character> getDefaultCharacters() {
    return [
      Character(
        name: '角色1',
        imageUrl: 'assets/image/ai_title_image/1.png',
        description: '这是角色1的简介。',
        likes: 100,
        shares: 50,
      ),
      Character(
        name: '角色2',
        imageUrl: 'assets/image/ai_title_image/2.png',
        description: '这是角色2的简介。',
        likes: 200,
        shares: 100,
      ),
      Character(
        name: '角色3',
        imageUrl: 'assets/image/ai_title_image/3.png',
        description: '这是角色3的简介。',
        likes: 100,
        shares: 50,
      ),
      Character(
        name: '角色4',
        imageUrl: 'assets/image/ai_title_image/4.png',
        description: '这是角色4的简介。',
        likes: 200,
        shares: 100,
      ),
      // 添加更多默认角色
    ];
  }
}

class user{
  int userId = 0; 
}

class Character {
  final String name;
  final String imageUrl;
  final String description;
  final int likes;
  final int shares;

  Character({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.likes,
    required this.shares,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'],
      imageUrl: json['imageUrl'],
      description: json['description'],
      likes: json['likes'],
      shares: json['shares'],
    );
  }
}