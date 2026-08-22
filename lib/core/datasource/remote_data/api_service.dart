import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/core/datasource/remote_data/api_config.dart';

class ApiService {

  Future<dynamic> get(String endpoint,{Map<String, dynamic>? params})async{

    var url = Uri.http(
      ApiConfig.baseUrl,
       "v2/$endpoint",
     {
      "apikey":ApiConfig.apikey,
      ...? params,
      },
     );
  

    final http.Response response= await http.get(url);

    return jsonDecode(response.body) as Map<String,dynamic>;
  }
}