// 记录集合
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/services/api_service.dart';

class MyDiaryPage extends StatelessWidget {
  String titlename = '';
  String avg = '';

  int level = 0;
  List<DiaryData> list;
  MyDiaryPage({required this.level})
  : list = ApiService().getdiarydata(level);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titlename),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titlename,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: list
                    .map((diary) => Expanded(
                          child: DiaryCard(name: diary.name, intercation: diary.interaction),
                        ))
                    .toList(),
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 5,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(4),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DiaryCard extends StatelessWidget {
  String name ;
  String intercation  ;

  DiaryCard({required this.name , required this.intercation});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '日记1',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text('简介'),
        SizedBox(height: 8),
        Container(
          width: 100,
          height: 10,
          color: Colors.grey[300],
        ),
      ],
    );
  }
}

class DiaryData{
    String name ;
    String interaction = '';

    DiaryData({required this.name, required this.interaction});
}
