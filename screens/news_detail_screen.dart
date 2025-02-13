import 'package:flutter/material.dart';
import '../models/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailScreen extends StatelessWidget {
  final News news;

  NewsDetailScreen({required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(news.title)),
      body: Column(
        children: [
          Image.network(news.imageUrl),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(news.description),
          ),
          ElevatedButton(
            onPressed: () => launch(news.url),
            child: Text("Read More"),
          ),
        ],
      ),
    );
  }
}
