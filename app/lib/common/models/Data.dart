import '../index.dart';

class Data {
  static final Data _instance = Data._(); // 私有构造函数和单例实例

  factory Data() {
    return _instance;
  }

  Data._() {}

  List<Character> getDefaultCharacters() {
    return [
      Character(
        name: '角色1',
        imageUrl: 'assets/image/ai_title_image/1.png',
        description: '这是角色1的简介。',
        likes: 100,
        shares: 50,
      ),
      Character(
        name: '角色2',
        imageUrl: 'assets/image/ai_title_image/2.png',
        description: '这是角色2的简介。',
        likes: 200,
        shares: 100,
      ),
      Character(
        name: '角色3',
        imageUrl: 'assets/image/ai_title_image/3.png',
        description: '这是角色3的简介。',
        likes: 100,
        shares: 50,
      ),
      Character(
        name: '角色4',
        imageUrl: 'assets/image/ai_title_image/4.png',
        description: '这是角色4的简介。',
        likes: 200,
        shares: 100,
      ),
      // 添加更多默认角色
    ];
  }
}
