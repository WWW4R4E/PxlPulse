import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/index.dart';
import 'package:flutter_application_1/pages/index.dart';

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
        'pages/ai_character_selection_page': (context) => CharacterPage(),
        'pages/love_diary_page': (context) => LoveDiaryPage(),
        'pages/social_post_page': (context) => SocialPostPage(),
        'pages/membership_page': (context) => MembershipPage(),
        'pages/login_page': (context) => InitialDataPage(),
        'pages/home_page' :(context) => HomePage()
      },
    );
  }
}
