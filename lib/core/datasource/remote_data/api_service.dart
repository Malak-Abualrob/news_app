import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {

  final String baseUrl= "newsapi.org";
  final String apikey= "4c7f59e7e06e4784875e498d1b2ef5e2";

  Future<dynamic> get(String endpoint,{Map<String, dynamic>? params})async{

    var url = Uri.http(
      baseUrl,
       "v2/$endpoint",
     {
      "apikey":apikey,
      ...? params,
      },
     );
  

    final http.Response response= await http.get(url);

    return jsonDecode(response.body) as Map<String,dynamic>;
  }
}