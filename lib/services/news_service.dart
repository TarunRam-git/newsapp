import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/news.dart';

class NewsService {
  static const String _apiKey = "2649c0107a51457b8e7597489a4b8724";
  static const String _baseUrl =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=$_apiKey";

  Future<List<News>> fetchNews() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['articles'] as List)
          .map((article) => News.fromJson(article))
          .toList();
    } else {
      throw Exception("Failed to load news");
    }
  }
}
