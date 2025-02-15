import 'package:flutter/material.dart';
import '../models/news.dart';
import '../screens/news_detail_screen.dart';

class NewsTile extends StatelessWidget {
  final News news;

  const NewsTile({Key? key, required this.news}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: news.imageUrl.isNotEmpty
              ? Image.network(
                  news.imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Image.asset("assets/images/placeholder.png", width: 100, height: 100, fit: BoxFit.cover),
                )
              : Image.asset(
                  "assets/images/placeholder.png",
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
        ),
        title: Text(
          news.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          news.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewsDetailScreen(news: news)),
          );
        },
      ),
    );
  }
}
