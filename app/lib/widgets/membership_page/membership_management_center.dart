// 会员管理中心
// 已开通会员用户可在此查看会员信息（开通时间、到期时间、会员等级）、更新支付方式、查看会员权益使用记录。 
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_member_payment_sdk/flutter_member_payment_sdk.dart'; // 假设使用此SDK[^3^]

class MembershipManagementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('会员管理中心'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildMemberInfoSection(),
            _buildPaymentUpdateSection(),
            _buildBenefitsUsageSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildMemberInfoSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '会员信息',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            FutureBuilder(
              future: FlutterMemberPaymentSDK.instance.member.fetchMemberInfo(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('获取会员信息失败: ${snapshot.error}');
                } else {
                  var memberInfo = snapshot.data!.memberInfo!;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('开通时间: ${memberInfo.activationDate}'),
                      Text('到期时间: ${memberInfo.expiryDate}'),
                      Text('会员等级: ${memberInfo.levelName}'),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentUpdateSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '更新支付方式',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // 跳转到更新支付方式页面
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentUpdatePage()),
                );
              },
              child: Text('更新支付方式'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBenefitsUsageSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '会员权益使用记录',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // 假设有一个方法获取会员权益使用记录
            FutureBuilder(
              future: _fetchBenefitsUsageRecords(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('获取使用记录失败: ${snapshot.error}');
                } else {
                  var records = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: records.length,
                    itemBuilder: (context, index) {
                      var record = records[index];
                      return ListTile(
                        title: Text(record['benefitName']),
                        subtitle: Text('使用时间: ${record['usageTime']}'),
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<List<Map<String, String>>> _fetchBenefitsUsageRecords() async {
    // 模拟从服务器获取会员权益使用记录
    await Future.delayed(Duration(seconds: 2));
    return [
      {'benefitName': '无限次 AI 训练', 'usageTime': '2023-10-01'},
      {'benefitName': '专属创作者内容提前观看', 'usageTime': '2023-10-02'},
      // 更多记录...
    ];
  }
}

class PaymentUpdatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('更新支付方式'),
      ),
      body: Center(
        child: Text('这里可以添加更新支付方式的表单等组件'),
      ),
    );
  }
}