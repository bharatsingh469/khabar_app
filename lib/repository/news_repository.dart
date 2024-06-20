import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:kahbar_app/model/categories_news_model.dart';
import 'package:kahbar_app/model/news_channels_headlines_model.dart';

class NewsRepository {
  // Future<NewsChannelsHeadlinesModel> fetchNewChannelHeadlinesApi(String channelName) async {
  //   String url =
  //       'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=462fd12af68c48488fe413205b4a393c';

  //   final response = await http.get(Uri.parse(url));
  //   // if (kDebugMode) {
  //   //   print(response.body);
  //   // }

  //   if (response.statusCode == 200) {
  //     final body = jsonDecode(response.body);
  //     return NewsChannelsHeadlinesModel.fromJson(body);
  //   }
  //   throw Exception('Error-> api not hit');
  // }

  Future<NewsChannelsHeadlinesModel> fetchNewChannelHeadlinesApi(
      String channelName) async {
    String url =
        'https://newsapi.org/v2/top-headlines?sources=${channelName}&apiKey=462fd12af68c48488fe413205b4a393c';
    print(url);
    final response = await http.get(Uri.parse(url));
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return NewsChannelsHeadlinesModel.fromJson(body);
    }
    throw Exception('Error');
  }

  // its for category wise news

  Future<CategoriesNewsModel> fetchCategoriesNewsApi(
      String category) async {
    String url =
        'https://newsapi.org/v2/everything?q=${category}&apiKey=462fd12af68c48488fe413205b4a393c';
    print(url);
    final response = await http.get(Uri.parse(url));
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return CategoriesNewsModel.fromJson(body);
    }
    throw Exception('Error');
  }
}
