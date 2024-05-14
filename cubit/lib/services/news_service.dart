import 'package:tp3/models/news.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsService {
  Future<List<News>> getAllNews() async {
    String url = 'http://127.0.0.1:8000/todos/?skip=0&limit=10';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> NewsJson = json.decode(response.body) as List<dynamic>;
      final news = NewsJson.map((json) => News.fromJson(json)).toList();
      return news;
    } else {
      throw Exception('Failed to load news');
    }
  }
}
