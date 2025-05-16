import 'dart:convert';

import 'package:flutter_application_1/common/widgets/ai_character_selection_page&home_page/interactive_preview.dart';
import 'package:http/http.dart' as http;

class CharacterApi {
  static const String baseUrl = 'http://localhost:5180/api';
  static final Data _defaultData = Data();

  Future<List<Character>> fetchCharacters({int page = 0}) async {
    try {
      final response =
          await http.get(Uri.parse('$baseUrl/characters?page=$page'));
      if (response.statusCode == 200) {
        final List<dynamic> charactersJson = jsonDecode(response.body);
        if (charactersJson.isEmpty) {
          return _defaultData.getDefaultCharacters();
        }
        return charactersJson
            .map<Character>((json) => Character.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load characters');
      }
    } catch (e) {
      print('Error fetching characters: $e');
      return _defaultData.getDefaultCharacters();
    }
  }

  InteractivePreview getAiDescription(int aiId) {
    return InteractivePreview(characterId: aiId, description: '', button: []);
  }

  String sendButtonDescription(String str) {
    return '';
  }

  Future<dynamic> getCharacterInteractions(String characterId) async {
    // TODO: 实现获取角色互动的逻辑
    return null;
  }

  Future<dynamic> sendUserInput(String characterId, String userInput) async {
    // TODO: 实现发送用户输入的逻辑
    return null;
  }
}

class Data {
  static final Data _instance = Data._();

  factory Data() {
    return _instance;
  }

  Data._();

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
    ];
  }
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
