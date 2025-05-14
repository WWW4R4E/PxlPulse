import 'package:flutter/material.dart';
import '../common/index.dart';

class HomeData{
  String title = '介绍';
  var button;
  
}

class Button{
    String name = '';
    String introdect = '';
}

class HomeAllPage extends StatelessWidget {
  var homeData = null;
 
  @override
  Widget build(BuildContext context) {
    homeData = CharacterApi().getAiDescription(0);
    return Scaffold(
      appBar: AppBar(
        title: Text('李航'),
      ),
      body: Center(
        child: Column(
          children: [
            gitintrodect(),
            gitbuttons(),
            
          ],
        ),
      ),
    );
  }

  // 简介
  Widget gitintrodect(){
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Text(
        homeData.title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  // 按钮组
  Widget gitbuttons(){
    return Column(
      children: [
        button(homeData.button.sublist(0, 4)),
        button(homeData.button.sublist(4, 8)),
      ],
    );
  }

  // 按钮
  Widget button(List<Button> buttons){
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: buttons.map((button) {
            return ElevatedButton(
              onPressed: () {
                // 这里处理点击事件
                CharacterApi().sendButtonDescription(button.introdect);
              },
              child: Text(button.name),
            );
          }).toList(),
        );
  }
}