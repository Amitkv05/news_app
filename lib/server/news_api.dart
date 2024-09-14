import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/pages/home_screen.dart';

Future<List> fetchnews({searchController}) async {
  final response = await http.get(
    Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=fee1b2cc20724cdfb7d60c750bebd302&pageSize=100' +
            '&q=' +
            HomeScreen.searchController.text),
  );
  Map result = jsonDecode(response.body);
  print('Fetched');

  return (result['articles']);
}

// 'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=fee1b2cc20724cdfb7d60c750bebd302&pageSize=100'+'&q='+SearchBar.searchcontroller.text