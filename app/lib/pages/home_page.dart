import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/love_diary_page.dart';
import 'package:flutter_application_1/pages/membership_page.dart';
import 'package:flutter_application_1/pages/publish_post_page.dart';
import 'ai_character_selection_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('星野恋曲'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AICharacterSelectionPage(),
                  ),
                );
              },
              child: Text('开始恋爱'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoveDiaryPage(),
                  ),
                );
              },
              child: Text('恋爱日记'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SocialPostPage(),
                  ),
                );
              },
              child: Text('社交动态'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MembershipPage(),
                  ),
                );
              },
              child: Text('会员中心'),
            ),
          ],
        ),
      ),
    );
  }
}