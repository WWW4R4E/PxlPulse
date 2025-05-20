import 'package:flutter/material.dart';

class Friend {
  final String name;
  final String avatarUrl;

  Friend({required this.name, required this.avatarUrl});
}

class FriendsList extends StatelessWidget {
  final List<Friend> friends = [
    Friend(name: "张三", avatarUrl: "https://example.com/avatar1.jpg"),
    Friend(name: "李四", avatarUrl: "https://example.com/avatar2.jpg"),
    Friend(name: "王五", avatarUrl: "https://example.com/avatar3.jpg"),
    // 添加更多朋友...
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: friends.length,
      itemBuilder: (context, index) {
        return FriendItem(friend: friends[index]);
      },
    );
  }
}

class FriendItem extends StatelessWidget {
  final Friend friend;

  FriendItem({required this.friend});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(friend.avatarUrl),
      ),
      title: Text(friend.name),
      trailing: Icon(Icons.more_vert), // 更多选项图标
      onTap: () {
        // 处理点击事件，例如导航到朋友的详细页面
        print("Clicked on ${friend.name}");
      },
    );
  }
}