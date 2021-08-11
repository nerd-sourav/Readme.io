import 'dart:convert';
import 'package:news/modals/article_modal.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModal> news = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=ecbe225f77e74bd6adb5ee03ae3868e6";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['title'] != null) {
          ArticleModal articleModal = ArticleModal(
            title: element['title'],
            description: element['description'],
            auther: element['author'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );

          news.add(articleModal);
        }
      });
    }
  }
}

class CategorieNewsClass {
  List<ArticleModal> news = [];
  final String category;

  CategorieNewsClass({this.category});

  Future<void> getNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=ecbe225f77e74bd6adb5ee03ae3868e6";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['title'] != null) {
          ArticleModal articleModal = ArticleModal(
            title: element['title'],
            description: element['description'],
            auther: element['author'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );

          news.add(articleModal);
        }
      });
    }
  }
}
