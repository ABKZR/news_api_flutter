import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_api_flutter/api/news_model.dart';
import 'package:news_api_flutter/constaints/strings.dart';

class NewsApi {
  Future<NewsModel> getapi() async {
    var client = http.Client();
    var newModel;
    try {
      var response = await client.get(Uri.parse(Strings().newsUrl));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        newModel = NewsModel.fromJson(jsonMap);
      }
    } catch (e) {
      return newModel;
    }
    return newModel;
  }
}
