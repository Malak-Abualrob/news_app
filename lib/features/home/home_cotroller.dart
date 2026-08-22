import 'package:flutter/cupertino.dart';
import 'package:news_app/core/datasource/remote_data/api_config.dart';
import 'package:news_app/core/datasource/remote_data/api_service.dart';
import 'package:news_app/features/home/models/news_article_model.dart';

class HomeController extends ChangeNotifier {
  HomeController() {
    getTopHeadLine();
    getEverythinge();
  }

  bool topHeadlineLoading = true;
  bool everthingLoading = true;
  String? errorMessage;

  List<NewsArticleModel> newsTopHeadLineList = [];
  List<NewsArticleModel> newsEverythingList = [];
  ApiService apiService = ApiService();

  Future<void> getTopHeadLine() async {
    try {
      Map<String, dynamic> result = await apiService.get(
        ApiConfig.topHeadlines,
        params: {"country": "us"},
      );

      newsTopHeadLineList = (result["articles"] as List)
          .map((e) => NewsArticleModel.fromJson(e))
          .toList();
      topHeadlineLoading = false;
      errorMessage = null;
    } catch (e) {
      topHeadlineLoading = false;
      errorMessage = e.toString();
    }
    notifyListeners();
  }

  Future<void> getEverythinge() async {
    try {
      Map<String, dynamic> result = await apiService.get(
        ApiConfig.everything,
        params: {"q": "news"},
      );

      newsEverythingList = (result["articles"] as List)
          .map((e) => NewsArticleModel.fromJson(e))
          .toList();
      everthingLoading = false;
      errorMessage = null;
    } catch (e) {
      everthingLoading = false;
      errorMessage = e.toString();
    }

    notifyListeners();
  }
}
