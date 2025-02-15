class Article {
  final String title;
  final String description;
  final String imageUrl;
  final String url;
  
  Article({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.url,
  });
  
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? 'No Title',
      description: json['description'] ?? 'No Description',
      imageUrl: json['urlToImage'] ?? '',
      url: json['url'] ?? '',
    );
  }
}
