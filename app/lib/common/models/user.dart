class user {
  int userId = 0;
}

class Character {
  final String name;
  final String imageUrl;
  final String description;
  final int likes;
  final int shares;

  Character({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.likes,
    required this.shares,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'],
      imageUrl: json['imageUrl'],
      description: json['description'],
      likes: json['likes'],
      shares: json['shares'],
    );
  }
}
