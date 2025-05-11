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
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InitialDataPage(),
      routes: {
        'pages/ai_character_selection_page': (context) => CharacterInteractionPage(),
        'pages/love_interaction_page': (context) => LoveInteractionPage(),
        'pages/love_diary_page': (context) => LoveDiaryPage(),
        'pages/social_post_page': (context) => SocialPostPage(),
        'pages/membership_page': (context) => MembershipPage(),
        'pages/login_page': (context) => InitialDataPage(),
        'pages/home_page' :(context) => HomePage()
      },
    );
  }
}