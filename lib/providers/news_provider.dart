import 'package:flutter/material.dart';
import '../api_service.dart';
import '../models/news.dart';

class NewsProvider with ChangeNotifier {
  List<News> _newsList = [];
  bool _isLoading = true;

  List<News> get newsList => _newsList;
  bool get isLoading => _isLoading;

  NewsProvider() {
    fetchNews();
  }

  Future<void> fetchNews() async {
    _isLoading = true;
    notifyListeners();

    try {
      _newsList = await ApiService().fetchNews();
    } catch (e) {
      _newsList = [];
    }

    _isLoading = false;
    notifyListeners();
  }
}
