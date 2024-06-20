import 'package:kahbar_app/model/categories_news_model.dart';
import 'package:kahbar_app/model/news_channels_headlines_model.dart';
import 'package:kahbar_app/repository/news_repository.dart';


class NewsViewModel {
  final _rep = NewsRepository();

  // Future<NewsChannelsHeadlinesModel> fetchNewChannelHeadlinesApi() async {
  //   final response = await _rep.fetchNewChannelHeadlinesApi();
  //   return response;
  // }

  // its for genral news

  Future<NewsChannelsHeadlinesModel> fetchNewChannelHeadlinesApi(String channelName) async{
    final response = await _rep.fetchNewChannelHeadlinesApi(channelName);
    return response ;
  }

  // its for category wise news

  Future<CategoriesNewsModel> fetchCategoriesNewsApi(String category) async{
    final response = await _rep.fetchCategoriesNewsApi(category);
    return response ;
  }
}
