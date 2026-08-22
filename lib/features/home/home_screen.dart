import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/core/datasource/remote_data/api_config.dart';
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
  
  bool isLoading= true;
  String? errorMessage;


  @override
  void initState() {
    getTopHeadLine();
    getEverythinge();
    super.initState();
  }

  getTopHeadLine()async{
    try{
      setState(() {
         isLoading= true;
         errorMessage=null;
      });
    Map<String,dynamic> result = await apiService.get(
      ApiConfig.topHeadlines,
      params: {
        "country":"us"
      },
      );

    setState((){
          newsTopHeadLineList = (result["articles"] as List)
          .map((e) => NewsArticleModel.fromJson(e))
          .toList();
         isLoading= false;
         errorMessage=null;
    });

    }catch(e){
      setState(() {
      isLoading= false;
      errorMessage = e.toString();
      });
    }
  }
    getEverythinge()async{
      try{
        setState(() {
         isLoading= true;
         errorMessage=null;
        });
      Map<String,dynamic> result = await apiService.get(
      ApiConfig.everything,
      params: {
        "q":"news"
      },
      );
  
    setState((){
          newsEverythingList = (result["articles"] as List)
          .map((e) => NewsArticleModel.fromJson(e))
          .toList();
         isLoading= false;
         errorMessage=null;
    });

      }catch(e){
      setState(() {
      isLoading= false;
      errorMessage = e.toString();
      });
     }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      (errorMessage?.isNotEmpty ?? false)
      ?Center(child: Text(errorMessage!))
      :isLoading
      ?Center(child: CircularProgressIndicator()) :
       Column(
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