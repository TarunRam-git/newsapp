import 'package:flutter/material.dart';
import '../models/news.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailScreen extends StatelessWidget {
  final News news;

  NewsDetailScreen({required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News Details")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(news.imageUrl),
            SizedBox(height: 10),
            Text(news.title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(news.description),
            Spacer(),
            ElevatedButton(
              onPressed: () async {
                if (await canLaunch(news.url)) {
                  await launch(news.url);
                }
              },
              child: Text("Read Full Article"),
            ),
          ],
        ),
      ),
    );
  }
}
