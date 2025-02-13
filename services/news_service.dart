import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/news_model.dart';
import '../utils/constants.dart';

class NewsService {
  static Future<List<News>> fetchNews(String category) async {
    final String url = "https://newsapi.org/v2/top-headlines?category=$category&country=us&apiKey=$apiKey";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List articles = json.decode(response.body)['articles'];
      return articles.map((json) => News.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load news");
    }
  }
}
