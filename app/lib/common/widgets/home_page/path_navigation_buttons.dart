import 'package:flutter/material.dart';

class PathNavigationButtons extends StatelessWidget {
  final List<String> paths;
  final List<String> labels;

  PathNavigationButtons({
    Key? key,
    required this.paths,
    required this.labels,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: paths.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => _buildPage(paths[index])),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              child: Text(labels[index]),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPage(String path) {
    switch (path) {
      case '/pages/index':
        return Page1();
      case '/pages/user_page':
        return Page4(); // Assuming you want to navigate to Page4 for user page
      default:
        return Placeholder();
    }
  }
}

// 示例页面定义
class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Index Page')),
      body: Center(child: Text('This is the Index Page')),
    );
  }
}

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Page')),
      body: Center(child: Text('This is the User Page')),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Path Navigation Buttons')),
      body: Center(
        child: PathNavigationButtons(
          paths: ['/pages/index', '/pages/friends_page', '/pages/user_page'], // Update paths as needed
          labels: ['Home', 'Profile', 'Other'], // Update labels accordingly
        ),
      ),
    ),
  ));
}