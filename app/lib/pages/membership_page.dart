import 'package:flutter/material.dart';

class MembershipPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('会员中心'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Card(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Text('会员等级：VIP 1'),
                    Text('有效期至：2024-12-31'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OpenMembershipPage(),
                  ),
                );
              },
              child: Text('开通会员'),
            ),
          ],
        ),
      ),
    );
  }
}

class OpenMembershipPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('开通会员'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Text('选择会员套餐：'),
            ListTile(
              title: Text('月度会员'),
              subtitle: Text('价格：30 元'),
              trailing: Radio(
                value: 1,
                groupValue: 1,
                onChanged: (value) {},
              ),
            ),
            ListTile(
              title: Text('年度会员'),
              subtitle: Text('价格：300 元'),
              trailing: Radio(
                value: 2,
                groupValue: 1,
                onChanged: (value) {},
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // 支付逻辑
              },
              child: Text('立即支付'),
            ),
          ],
        ),
      ),
    );
  }
}