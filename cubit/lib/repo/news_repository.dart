import 'package:tp3/models/news.dart';
import 'package:tp3/services/news_service.dart';

class NewsRepository {
  final NewsService _newsService = NewsService();

  Future<List<News>> getAllNews() async {
    try {
      final news = await _newsService.getAllNews();
      return news;
    } catch (error) {
      throw Exception('Failed to load news');
    }
  }
}
