import 'package:flutter/material.dart';
import '../models/article.dart';
import '../services/news_service.dart';

class NewsProvider with ChangeNotifier {
  List<Article> _articles = [];
  bool _isLoading = false;
  
  List<Article> get articles => _articles;
  bool get isLoading => _isLoading;
  
  Future<void> fetchNews({String country = "us", String category = "general"}) async {
    _isLoading = true;
    notifyListeners();
    
    try {
      _articles = await NewsService().fetchTopHeadlines(country: country, category: category);
    } catch (e) {
      // Log error; in production, you might want to set an error message.
      print("Error fetching news: $e");
      _articles = [];
    }
    
    _isLoading = false;
    notifyListeners();
  }
}
