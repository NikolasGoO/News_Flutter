import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article.dart';

class NewsService {
  final String _apiKey = 'ca7c1578c6504f5f8d749dfb6c771522';
  final String _baseUrl = 'https://newsapi.org/v2/';

  Future<List<Article>> fetchNews({String query = ''}) async {
    final url = Uri.parse('${_baseUrl}top-headlines?apiKey=$_apiKey&q=$query');
    final allNews = Uri.parse('${_baseUrl}top-headlines?apiKey=$_apiKey&country=us');

    try {
      final response = await http.get(url);
      final alternativeResponse = await http.get(allNews);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final articles = (data['articles'] as List).map((json) => Article.fromJson(json)).toList();
        return articles;

      } else if(response.statusCode != 200) {
        final data = json.decode(alternativeResponse.body);
        final articles = (data['articles'] as List).map((json) => Article.fromJson(json)).toList();
        return articles;
      }
      else {
        throw Exception('Erro ao buscar notícias');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
