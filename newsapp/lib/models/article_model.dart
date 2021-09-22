import 'package:flutter/cupertino.dart';

class Article {
  final String? title;
  final String? description;
  final String? imageUrl;
  final String? articleUrl;
  Article({this.title, this.description, this.imageUrl, this.articleUrl});

  factory Article.fromjson(Map<String, dynamic> jsonData) {
    return Article(
        title: jsonData['title'] == null ? "News Title" : jsonData['title'],
        description:
            jsonData['description'] == null ? "" : jsonData['description'],
        imageUrl: jsonData['urlToImage'] == null?"" : jsonData['urlToImage'],
        articleUrl: jsonData['url']);
  }
}

Article article = Article();
