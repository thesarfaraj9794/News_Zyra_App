import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:news_app/model/newsArt.dart';

class FetchNews {
  static const String apiKey = "";
  static const String defaultSource = "techcrunch";

  // ✅ Switch: true = dummy data, false = live API
  static const bool useDummyData = false;

  static Future<NewsArt> fetchNews() async {
    try {
      if (useDummyData) {
        // 🔹 Dummy JSON load karega
        final String response = await rootBundle.loadString('assets/news.json');
        final Map<String, dynamic> bodyData = jsonDecode(response);

        List articles = bodyData["articles"];
        if (articles.isEmpty) throw Exception("No articles found");

        var myArticle = articles[Random().nextInt(articles.length)];
        return NewsArt.fromAPItoApp(myArticle);
      } else {
        // 🔹 Live API call karega
        Response response = await get(
          Uri.parse(
            "https://newsapi.org/v2/top-headlines?sources=$defaultSource&apiKey=$apiKey",
          ),
        ).timeout(const Duration(seconds: 10));

        if (response.statusCode != 200) {
          throw Exception("Failed to fetch news: ${response.statusCode}");
        }

        Map bodyData = jsonDecode(response.body);
        List articles = bodyData["articles"];

        if (articles.isEmpty) throw Exception("No articles found");

        var myArticle = articles[Random().nextInt(articles.length)];
        return NewsArt.fromAPItoApp(myArticle);
      }
    } catch (e) {
      throw Exception("Error fetching news: $e");
    }
  }
}
