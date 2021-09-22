import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart';
import 'package:newscloud/models/article_model.dart';
import 'package:newscloud/models/articlesmodel.dart';

class NewsApi {
  final String apiKey = 'f478f895b3eb4411bace956a337860f3';

  Future? fetchArticles() async {
    try {
      Response response = await get(Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=eg&apiKey=$apiKey'));
      if (response.statusCode == 200) {
        String data = response.body;

        var jsonData = jsonDecode(data);
        Articles articles = Articles.fromjson(jsonData);
        List<Article> articleList =
            articles.articles.map((e) => Article.fromjson(e)).toList();
        return articleList;
      } else {
        print('Status code =${response.statusCode}');
      }
    } catch (ex) {
      print(ex);
    }
  }

  Future<List<Article>> fetchArticlesByCategory(String category) async {
    try {
      Response response = await get(Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=$apiKey'));
      if (response.statusCode == 200) {
        String data = response.body;

        var jsonData = jsonDecode(data);
        Articles articles = Articles.fromjson(jsonData);
        List<Article> articleList =
            articles.articles.map((e) => Article.fromjson(e)).toList();
        return articleList;
      } else {
        return [];
        print('Status code =${response.statusCode}');
      }

    } catch (ex) {
      print(ex);
    }
    return [];
  }
}
