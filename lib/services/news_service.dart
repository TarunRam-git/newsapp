import '../models/news.dart';
import 'api_service.dart';

class NewsService {
  final ApiService _apiService = ApiService();

  Future<List<News>> getNews() async {
    try {
      List<News> newsList = await _apiService.fetchNews();
      return newsList;
    } catch (e) {
      print("Error fetching news: $e");
      return [];
    }
  }
}
