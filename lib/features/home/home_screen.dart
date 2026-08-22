import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<dynamic> list =[];

  @override
  void initState() {
    callEndpoint();
    super.initState();
  }

  callEndpoint()async{

    var urlForTopHeadline = Uri.https('newsapi.org','v2/top-headlines',
      {"apikey": "4c7f59e7e06e4784875e498d1b2ef5e2",
       "country": "us",
      }
      );
  
    print(urlForTopHeadline);

    final http.Response response= await http.get(urlForTopHeadline);

    Map<String,dynamic> result = jsonDecode(response.body) as Map<String,dynamic>;

    //Map<key,value> => List<Map>.
    print(result["articles"][0]["description"]);

    setState((){
          list = result["article"];
    });



    // var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');

    // print(await http.read(Uri.https('example.com', 'foobar.txt')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
              return Text(list[index]["title"] ?? "");
            },
            ),
          )
        ],
      ),
    );
  }
}