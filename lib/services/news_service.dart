import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article.dart';

class NewsService {
  final String _apiKey = 'ca7c1578c6504f5f8d749dfb6c771522';
  final String _baseUrl = 'https://newsapi.org/v2/top-headlines';

  Future<List<Article>> fetchNews({String query = '', int page = 1}) async {
    final url = Uri.parse('$_baseUrl?apiKey=$_apiKey&q=$query&page=$page');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final articles = (data['articles'] as List).map((json) => Article.fromJson(json)).toList();
        return articles;
      } else {
        throw Exception('Erro ao buscar notícias');
      }
    } catch (e) {
      throw Exception('Erro de conexão: $e');
    }
  }
}
