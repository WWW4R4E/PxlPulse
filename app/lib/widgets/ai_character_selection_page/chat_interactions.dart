// 角色展示区
import 'package:flutter/material.dart';
import '../services/api_service.dart';

class CharacterListPage extends StatefulWidget {
  @override
  _CharacterListPageState createState() => _CharacterListPageState();
}

class _CharacterListPageState extends State<CharacterListPage> {
  late ApiService apiService;
  List<Character> characters = [];
  bool isLoading = true;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    apiService = ApiService(); // 注意这里的拼写错误，应该是apiService而不是apiService
    _loadCharacters();
  }

  Future<void> _loadCharacters() async {
    try {
      setState(() => isLoading = true);
      final newCharacters = await apiService.fetchCharacters(page: currentPage);
      setState(() {
        if (currentPage == 0) {
          characters = newCharacters;
        } else {
          characters.addAll(newCharacters);
        }
        isLoading = false;
      });
    } catch (e) {
      print(e);
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('角色列表'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: _buildCharacterRows(),
            ),
    );
  }

  List<Widget> _buildCharacterRows() {
    List<Widget> rows = [];
    for (int i = 0; i < characters.length; i += 2) {
      rows.add(_div(context, characters[i], i + 1 < characters.length ? characters[i + 1] : null));
    }
    return rows;
  }

  // 构建外部盒子
  Widget _div(BuildContext context, Character? character1, Character? character2) {
    return Row(
      children: <Widget>[
        if (character1 != null) 
          Container(
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07), // 设置左边距为屏幕宽度的7%
            child: _centerdiv(character1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0), // 圆角半径
              border: Border.all(color: Colors.black), // 黑色边框
            ),
          ),
        if (character2 != null) 
          Container(
            margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.07), // 设置右边距为屏幕宽度的7%
            child: _centerdiv(character2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0), // 圆角半径
              border: Border.all(color: Colors.black), // 黑色边框
            ),
          ),
      ],
    );
  }

  // 构建内部盒子
  Widget _centerdiv(Character character) {
    return Column(
      children: <Widget>[
        // 构建头像
        Container(
          width: MediaQuery.of(context).size.width * 0.4, // 设置图片宽度为屏幕宽度的40%
          height: 100.0, // 设置图片高度
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(character.imageUrl),
              fit: BoxFit.cover, // 确保图片覆盖整个Container
              alignment: Alignment.topCenter, // 图片内容靠上
            ),
          ),
        ),
        // 构建内容
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            Text(
              character.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left, // 确保文本靠左对齐
            ),
            _buildCharacterItem(character),
          ],
        ),
        SizedBox(height: 10),
        Text(
          character.description,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          textAlign: TextAlign.left, // 确保文本靠左对齐
        ),
      ],
    );
  }

  Widget _buildCharacterItem(Character character) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '${character.likes} ',
          style: TextStyle(color: Colors.blue),
          textAlign: TextAlign.left, // 确保文本靠左对齐
        ),
        SizedBox(width: 8),
        Text(
          '${character.shares} ',
          style: TextStyle(color: Colors.red),
          textAlign: TextAlign.left, // 确保文本靠左对齐
        ),
      ],
    );
  }
}