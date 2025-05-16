// 用户信息简介

import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/api/api_service.dart';
import 'package:flutter_application_1/common/api/user_api.dart';

class UserData {
  String imagetitlesrc = '';
  String nmae = '';
  String createcatetime = '';
  int piecesnumber = 0;
  String interaction = '简介';
  int member = 0; // 属于哪种类型的会员，默认0 为 无会员

  UserData gitUserData() {
    return UserApi().getUserInteraction(); // 获取用户详细信息
  }
}

class UserProfileWidget extends StatelessWidget {
  UserData userData = UserData().gitUserData();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage:
                    AssetImage(userData.imagetitlesrc), // 替换为实际头像路径
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userData.nmae,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildInfoItem('创建时间', userData.createcatetime),
                        _buildInfoItem('作品数量', userData.piecesnumber as String),
                        _buildInfoItem('会员', userData.member as String),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      userData.interaction,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String title, String value) {
    return Column(
      children: [
        Text(title, style: TextStyle(fontSize: 14)),
        SizedBox(height: 4),
        Container(
          width: 50,
          height: 10,
          color: Colors.grey[300],
        ),
      ],
    );
  }
}
