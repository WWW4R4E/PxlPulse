import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/ai_character_selection_page.dart';
import 'pages/love_interaction_page.dart';
import 'pages/love_diary_page.dart';
import 'pages/social_post_page.dart';
import 'pages/membership_page.dart';
import 'pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}