import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/news_provider.dart';
import 'article_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Delay the fetch until after the current build frame to avoid setState errors.
    Future.microtask(() {
      Provider.of<NewsProvider>(context, listen: false).fetchNews();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Aggregator'),
      ),
      body: newsProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : newsProvider.articles.isEmpty
              ? const Center(child: Text('No news available.'))
              : ListView.builder(
                  itemCount: newsProvider.articles.length,
                  itemBuilder: (context, index) {
                    final article = newsProvider.articles[index];
                    return ListTile(
                      leading: article.imageUrl.isNotEmpty
                          ? Image.network(article.imageUrl, width: 100, fit: BoxFit.cover)
                          : Image.asset('assets/images/placeholder.png', width: 100, fit: BoxFit.cover),
                      title: Text(article.title, maxLines: 2, overflow: TextOverflow.ellipsis),
                      subtitle: Text(article.description, maxLines: 2, overflow: TextOverflow.ellipsis),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ArticleDetailScreen(article: article),
                          ),
                        );
                      },
                    );
                  },
                ),
    );
  }
}
