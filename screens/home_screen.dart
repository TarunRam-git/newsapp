import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/news_provider.dart';
import '../widgets/news_tile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categories = ["general", "business", "sports", "technology"];
  String selectedCategory = "general";

  @override
  void initState() {
    super.initState();
    Provider.of<NewsProvider>(context, listen: false).fetchNews(selectedCategory);
  }

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("News Aggregator")),
      body: Column(
        children: [
          // Category Selector
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() => selectedCategory = categories[index]);
                    newsProvider.fetchNews(selectedCategory);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: selectedCategory == categories[index] ? Colors.blue : Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(child: Text(categories[index], style: TextStyle(color: Colors.white))),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: newsProvider.isLoading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: newsProvider.newsList.length,
                    itemBuilder: (context, index) {
                      return NewsTile(news: newsProvider.newsList[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
