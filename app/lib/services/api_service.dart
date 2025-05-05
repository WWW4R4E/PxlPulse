import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class ApiService {
  static const String baseUrl = 'http://localhost:5180/api';

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
}