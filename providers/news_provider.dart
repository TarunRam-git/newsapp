import 'package:flutter/material.dart';
import '../models/news_model.dart';
import '../services/news_service.dart';

class NewsProvider with ChangeNotifier {
  List<News> _newsList = [];
  bool _isLoading = false;

  List<News> get newsList => _newsList;
  bool get isLoading => _isLoading;

  Future<void> fetchNews(String category) async {
    _isLoading = true;
    notifyListeners();

    _newsList = await NewsService.fetchNews(category);

    _isLoading = false;
    notifyListeners();
  }
}
