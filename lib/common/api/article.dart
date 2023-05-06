class Article {
  final String title;
  final String author;
  final String description;
  final String urlToImage;
  final String publishedAt;
  final String content;

  Article(
      {required this.title,
      required this.author,
      required this.description,
      required this.urlToImage,
      required this.publishedAt,
      required this.content});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        title: json['title'],
        author: json['author'] ?? 'Unknown',
        description: json['description'] ?? '',
        urlToImage: json['urlToImage'] ?? '',
        publishedAt: json['publishedAt'],
        content: json['content'] ?? '');
  }
}
