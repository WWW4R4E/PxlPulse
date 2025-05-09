// 会员套餐选择
// 提供月度、季度、年度三种会员套餐，以卡片形式展示，包含套餐价格、具体包含的权益列表、主打推荐标识（如推荐月度体验、超值季度、划算年度）。 
import 'package:flutter/material.dart';

class MembershipPackagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('会员套餐选择'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '选择适合您的会员套餐',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildMembershipCard(
                    context,
                    title: '月度套餐',
                    price: '¥29.99',
                    benefits: [
                      '30天会员权益',
                      '每月专属优惠',
                      '优先客服支持',
                    ],
                    isRecommended: false,
                  ),
                  _buildMembershipCard(
                    context,
                    title: '季度套餐',
                    price: '¥79.99',
                    benefits: [
                      '90天会员权益',
                      '季度专属福利',
                      '优先客服支持',
                      '额外折扣',
                    ],
                    isRecommended: true,
                  ),
                  _buildMembershipCard(
                    context,
                    title: '年度套餐',
                    price: '¥239.99',
                    benefits: [
                      '365天会员权益',
                      '年度专属福利',
                      '优先客服支持',
                      '额外折扣',
                      '专属活动邀请',
                    ],
                    isRecommended: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMembershipCard(BuildContext context,
      {required String title,
      required String price,
      required List<String> benefits,
      required bool isRecommended}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isRecommended ? Colors.green : Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  price,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (isRecommended)
                  SizedBox(height: 8) +
                      Text(
                        '推荐',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: benefits.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.check_circle, color: Colors.green),
                  title: Text(benefits[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // 购买逻辑
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('已选择 $title 套餐')),
                );
              },
              child: Text('立即购买'),
            ),
          ),
        ],
      ),
    );
  }
}