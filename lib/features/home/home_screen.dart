import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/features/home/models/news_article_model.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<NewsArticleModel> newsTopHeadLineList =[];
  List<NewsArticleModel> newsEverythingList =[];


  @override
  void initState() {
    getTopHeadLine();
    getEverythinge();
    super.initState();
  }

  getTopHeadLine()async{

    var urlForTopHeadline = Uri.https('newsapi.org','v2/top-headlines',
      {"apikey": "4c7f59e7e06e4784875e498d1b2ef5e2",
       "country": "us",
      }
      );
  

    final http.Response response= await http.get(urlForTopHeadline);

    Map<String,dynamic> result = jsonDecode(response.body) as Map<String,dynamic>;


    setState((){
          newsTopHeadLineList = (result["articles"] as List)
          .map((e) => NewsArticleModel.fromJson(e))
          .toList();
    });

  }
    getEverythinge()async{

    var urlForTopHeadline = Uri.https('newsapi.org','v2/everything',
      {"apikey": "4c7f59e7e06e4784875e498d1b2ef5e2",
      "q": "news"
      }
      );
  

    final http.Response response= await http.get(urlForTopHeadline);

    Map<String,dynamic> result = jsonDecode(response.body) as Map<String,dynamic>;


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