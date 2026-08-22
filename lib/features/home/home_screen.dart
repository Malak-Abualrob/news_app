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
  @override
  void initState() {
    getTopHeadLine();
    getEverythinge();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (errorMessage?.isNotEmpty ?? false)
          ? Center(child: Text(errorMessage!))
          : isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: newsTopHeadLineList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(newsTopHeadLineList[index].title);
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
