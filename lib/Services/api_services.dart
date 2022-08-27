import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/Model/article_model.dart';

  Future <List<NewsApiModel>> getNews() async{
    Uri uri = Uri.parse("https://newsapi.org/v2/everything?domains=techcrunch.com&apiKey=66b8f4acbe114d0d8e64e057b378d273");
    final response = await http.get(uri);
    if(response.statusCode == 200 || response.statusCode == 201){
      print(response.body);
      Map<String,dynamic> map = json.decode(response.body);

      List _articalsList = map['articles'];
      List<NewsApiModel> newsList = _articalsList.map((jsonData) => NewsApiModel.fromJson(jsonData)).toList();
      return newsList;
    }else{
      print("error");
      return [];
    }
  }

