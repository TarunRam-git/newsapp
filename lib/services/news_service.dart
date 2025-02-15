import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article.dart';

class NewsService {
  static const String _apiKey = "c36d9dcfa849478f94a5a6777ba6d381";
  static const String _baseUrl = "https://newsapi.org/v2/top-headlines";

  Future<List<Article>> fetchTopHeadlines({String country = "us", String category = "general"}) async {
    final String url = "$_baseUrl?country=$country&category=$category&apiKey=$_apiKey";
    final response = await http.get(Uri.parse(url));
    
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data["status"] == "ok") {
        List<dynamic> articlesJson = data["articles"];
        return articlesJson.map((json) => Article.fromJson(json)).toList();
      } else {
        throw Exception("API error: ${data['message']}");
      }
    } else if (response.statusCode == 429) {
      throw Exception("Failed to load news: 429 Too Many Requests. You have exceeded your API rate limit.");
    } else {
      throw Exception("Failed to load news: ${response.statusCode}");
    }
  }
}
