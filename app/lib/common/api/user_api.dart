import 'dart:convert';

import 'package:flutter_application_1/common/widgets/user_page/user_title_interaction.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static const String baseUrl = 'http://localhost:5180/api';

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

  UserData getUserInteraction() {
    return UserData();
  }
}
