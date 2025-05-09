// 会员购买流程
// 引导用户选择套餐、填写支付信息（支持主流支付方式：微信、支付宝、银联等）、确认支付，支付成功后展示会员开通成功页面，包含会员有效期、会员头衔等信息。
import 'package:flutter/material.dart';

class MembershipPurchasePage extends StatefulWidget {
  @override
  _MembershipPurchasePageState createState() => _MembershipPurchasePageState();
}

class _MembershipPurchasePageState extends State<MembershipPurchasePage> {
  String selectedPackage = '月度套餐';
  String paymentMethod = '微信支付';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('会员购买'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '选择会员套餐',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            _buildPackageSelection(),
            SizedBox(height: 32),
            Text(
              '选择支付方式',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            _buildPaymentMethodSelection(),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // 确认支付
                _confirmPayment();
              },
              child: Text('确认支付'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPackageSelection() {
    return Column(
      children: [
        ListTile(
          title: Text('月度套餐'),
          subtitle: Text('¥29.99'),
          trailing: Radio(
            value: '月度套餐',
            groupValue: selectedPackage,
            onChanged: (value) {
              setState(() {
                selectedPackage = value!;
              });
            },
          ),
        ),
        ListTile(
          title: Text('季度套餐'),
          subtitle: Text('¥79.99'),
          trailing: Radio(
            value: '季度套餐',
            groupValue: selectedPackage,
            onChanged: (value) {
              setState(() {
                selectedPackage = value!;
              });
            },
          ),
        ),
        ListTile(
          title: Text('年度套餐'),
          subtitle: Text('¥239.99'),
          trailing: Radio(
            value: '年度套餐',
            groupValue: selectedPackage,
            onChanged: (value) {
              setState(() {
                selectedPackage = value!;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentMethodSelection() {
    return Column(
      children: [
        ListTile(
          title: Text('微信支付'),
          trailing: Radio(
            value: '微信支付',
            groupValue: paymentMethod,
            onChanged: (value) {
              setState(() {
                paymentMethod = value!;
              });
            },
          ),
        ),
        ListTile(
          title: Text('支付宝'),
          trailing: Radio(
            value: '支付宝',
            groupValue: paymentMethod,
            onChanged: (value) {
              setState(() {
                paymentMethod = value!;
              });
            },
          ),
        ),
        ListTile(
          title: Text('银联支付'),
          trailing: Radio(
            value: '银联支付',
            groupValue: paymentMethod,
            onChanged: (value) {
              setState(() {
                paymentMethod = value!;
              });
            },
          ),
        ),
      ],
    );
  }

  void _confirmPayment() {
    // 模拟支付成功
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('会员开通成功！您选择的是 $selectedPackage 套餐，支付方式为 $paymentMethod。'),
        duration: Duration(seconds: 5),
        action: SnackBarAction(
          label: '完成',
          onPressed: () {
            // 关闭 SnackBar
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            // 可以在这里执行其他操作，例如返回主页
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}