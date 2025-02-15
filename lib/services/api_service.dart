import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/news.dart';

class ApiService {
  final String apiKey = "2649c0107a51457b8e7597489a4b8724"; // Your API Key
  final String baseUrl = "https://newsapi.org/v2/top-headlines?country=in";

  Future<List<News>> fetchNews() async {
    final response = await http.get(Uri.parse("$baseUrl&apiKey=$apiKey"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<News> articles = (data["articles"] as List)
          .map((json) => News.fromJson(json))
          .toList();
      return articles;
    } else {
      throw Exception("Failed to load news");
    }
  }
}
