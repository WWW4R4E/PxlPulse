// 日记列表区
// 时间轴卡片式展示，含日期、天气、标题、截图。
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // 用于复制文本到剪贴板
import 'package:share/share.dart'; // 用于分享功能
import 'package:url_launcher/url_launcher.dart'; // 用于生成链接

class DiaryDetailPage extends StatefulWidget {
  final String diaryTitle;
  final String diaryContent;
  final List<String> diaryImages;
  final List<String> chatRecords;

  DiaryDetailPage({
    required this.diaryTitle,
    required this.diaryContent,
    required this.diaryImages,
    required this.chatRecords,
  });

  @override
  _DiaryDetailPageState createState() => _DiaryDetailPageState();
}

class _DiaryDetailPageState extends State<DiaryDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.diaryTitle),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // 跳转到编辑页面
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DiaryEditPage(
                    diaryTitle: widget.diaryTitle,
                    diaryContent: widget.diaryContent,
                    diaryImages: widget.diaryImages,
                    chatRecords: widget.chatRecords,
                  ),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              // 生成并分享链接
              _shareDiaryLink();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // 日记标题
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.diaryTitle,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            // 日记内容
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.diaryContent,
                style: TextStyle(fontSize: 16),
              ),
            ),
            // 日记图片
            if (widget.diaryImages.isNotEmpty)
              Column(
                children: widget.diaryImages.map((imageUrl) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      imageUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  );
                }).toList(),
              ),
            // 对话记录片段
            if (widget.chatRecords.isNotEmpty)
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      '对话记录',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ...widget.chatRecords.map((record) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        record,
                        style: TextStyle(fontSize: 16),
                      ),
                    );
                  }).toList(),
                ],
              ),
          ],
        ),
      ),
    );
  }

  void _shareDiaryLink() async {
    // 生成日记链接
    String diaryLink =
        'https://your-app.com/diary/${widget.diaryTitle.replaceAll(' ', '_')}';

    // 分享链接
    await Share.share(diaryLink);
  }
}

class DiaryEditPage extends StatefulWidget {
  final String diaryTitle;
  final String diaryContent;
  final List<String> diaryImages;
  final List<String> chatRecords;

  DiaryEditPage({
    required this.diaryTitle,
    required this.diaryContent,
    required this.diaryImages,
    required this.chatRecords,
  });

  @override
  _DiaryEditPageState createState() => _DiaryEditPageState();
}

class _DiaryEditPageState extends State<DiaryEditPage> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;
  late List<String> _images;
  late List<String> _chatRecords;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.diaryTitle);
    _contentController = TextEditingController(text: widget.diaryContent);
    _images = List.from(widget.diaryImages);
    _chatRecords = List.from(widget.chatRecords);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    // 保存编辑内容
    // 这里可以调用 API 保存到后端
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('编辑日记'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveChanges,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: '标题',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _contentController,
                decoration: InputDecoration(
                  labelText: '内容',
                ),
                maxLines: null,
              ),
            ),
            // 这里可以添加图片和对话记录的编辑功能
          ],
        ),
      ),
    );
  }
}
