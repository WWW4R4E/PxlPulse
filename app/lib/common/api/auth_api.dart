import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthApi {
  static const String baseUrl = 'http://localhost:5180/api';

  Future<dynamic> login(
      {required String email, required String password}) async {
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
}
