import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/core/datasource/remote_data/api_service.dart';
import 'package:news_app/features/home/models/news_article_model.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<NewsArticleModel> newsTopHeadLineList =[];
  List<NewsArticleModel> newsEverythingList =[];
  ApiService apiService = ApiService();


  @override
  void initState() {
    getTopHeadLine();
    getEverythinge();
    super.initState();
  }

  getTopHeadLine()async{
  
    Map<String,dynamic> result = await apiService.get(
      "top_headline",
      params: {
        "country":"us"
      },
      );

    setState((){
          newsTopHeadLineList = (result["articles"] as List)
          .map((e) => NewsArticleModel.fromJson(e))
          .toList();
    });

  }
    getEverythinge()async{

      Map<String,dynamic> result = await apiService.get(
      "everything",
      params: {
        "q":"news"
      },
      );
  
    setState((){
          newsEverythingList = (result["articles"] as List)
          .map((e) => NewsArticleModel.fromJson(e))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: newsTopHeadLineList.length,
              itemBuilder: (BuildContext context, int index) {
              return Text(newsTopHeadLineList[index].title);
            },
            ),
          )
        ],
      ),
    );
  }
}