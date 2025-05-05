import 'package:flutter/material.dart';

class LoveDiaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('恋爱日记'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('日记 1'),
            subtitle: Text('日期：2024-10-01'),
          ),
          ListTile(
            title: Text('日记 2'),
            subtitle: Text('日期：2024-10-02'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddDiaryPage(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddDiaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('添加日记'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: '输入日记标题...',
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: TextField(
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  hintText: '输入日记内容...',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // 保存日记的逻辑
              },
              child: Text('保存日记'),
            ),
          ],
        ),
      ),
    );
  }
}