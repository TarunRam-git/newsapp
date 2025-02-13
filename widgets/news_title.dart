import 'package:flutter/material.dart';
import '../models/news_model.dart';
import '../screens/news_detail_screen.dart';

class NewsTile extends StatelessWidget {
  final News news;

  NewsTile({required this.news});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: Image.network(news.imageUrl, width: 100, fit: BoxFit.cover),
        title: Text(news.title, maxLines: 2, overflow: TextOverflow.ellipsis),
        subtitle: Text(news.description, maxLines: 3, overflow: TextOverflow.ellipsis),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NewsDetailScreen(news: news)),
        ),
      ),
    );
  }
}
