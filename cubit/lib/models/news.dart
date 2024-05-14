// lib/models/todo.dart

class News {
  final int id;
  final String title;
  final bool completed;
  final String abstract;
  final String content;
  final int userId;

  News({
    required this.id,
    required this.title,
    required this.completed,
    required this.abstract,
    required this.content,
    required this.userId,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
      abstract: json['abstract'],
      content: json['content'],
      userId: json['userId'],
    );
  }
}
