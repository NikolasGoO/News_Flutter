import 'dart:ffi';

import 'package:flutter/material.dart';
import '../models/article.dart';
import '../services/news_service.dart';
import 'news_details_screen.dart';

class NewsHomeScreen extends StatefulWidget {
  @override
  _NewsHomeScreenState createState() => _NewsHomeScreenState();
}

class _NewsHomeScreenState extends State<NewsHomeScreen> {
  final NewsService _newsService = NewsService();
  final TextEditingController _searchController = TextEditingController();
  List<Article> _articles = [];
  String _query = ''; // Termo de pesquisa
  bool _isLoading = false;
  bool _isSearching = false; // Define se o campo de busca está ativo
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _fetchNews(); // Carrega as notícias iniciais
  }

  Future<void> _fetchNews() async {
    if (_isLoading) return;

    setState(() => _isLoading = true);

    try {
      final fetchedArticles = await _newsService.fetchNews(query: _query);
      setState(() {
        _articles = fetchedArticles;
      });
    } catch (e) {
      print('Erro ao buscar notícias: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _onSearch(String query) {
    setState(() {
      _query = query;
      _articles = [];
    });
    _fetchNews();
  }

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (!_isSearching) {
        _query = '';
        _searchController.clear();
        _fetchNews();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearching
            ? TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: 'Pesquise por notícias...',
          ),
          onSubmitted: _onSearch,
        )
            : const Text('Notícias'),
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search),
            onPressed: _toggleSearch,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _articles.isEmpty
          ? const Center(child: Text('Nenhuma notícia encontrada.'))
          : ListView.builder(
        itemCount: _articles.length,
        itemBuilder: (context, index) {
          final article = _articles[index];
          return ListTile(
            leading: article.imageUrl != null
                ? Image.network(
              article.imageUrl!,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            )
                : const SizedBox(width: 100, height: 100, child: Icon(Icons.image)),
            title: Text(article.title),
            subtitle: Text(article.description),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(article: article),
              ),
            ),
          );
        },
      ),
    );
  }
}
