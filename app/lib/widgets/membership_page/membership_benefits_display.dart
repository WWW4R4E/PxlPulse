// 会员权益展示
// 详细展示会员可享受的权益，如无限次 AI 训练、专属创作者内容提前观看、粉丝专属福利、个性化定制服务等，每个权益以图标和文字简述形式呈现。 
import 'package:flutter/material.dart';

class MembershipBenefitsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var personalize;
    return Scaffold(
      appBar: AppBar(
        title: Text('会员权益'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              _buildBenefitItem(
                icon: Icons.train,
                title: '无限次 AI 训练',
                description: '享受无限次 AI 训练，提升你的 AI 角色体验。',
              ),
              _buildBenefitItem(
                icon: Icons.videocam,
                title: '专属创作者内容提前观看',
                description: '提前观看创作者的独家内容，获取最新资讯。',
              ),
              _buildBenefitItem(
                icon: Icons.favorite,
                title: '粉丝专属福利',
                description: '享受粉丝专属福利，与创作者更亲近。',
              ),
              _buildBenefitItem(
                icon: Icons.settings,
                title: '个性化定制服务',
                description: '定制你的专属体验，让应用更符合你的需求。',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBenefitItem({required IconData icon, required String title, required String description}) {
    return Card(
      child: ListTile(
        leading: Icon(icon, size: 40, color: Colors.pink),
        title: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          description,
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ),
    );
  }
}

