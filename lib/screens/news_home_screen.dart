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
  String _query = '';  // O termo de pesquisa
  bool _isLoading = false;
  int _currentPage = 1;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _fetchNews();
    _scrollController.addListener(_onScroll);
  }

  Future<void> _fetchNews({bool isLoadMore = false}) async {
    if (_isLoading) return;

    setState(() => _isLoading = true);

    try {
      final fetchedArticles = await _newsService.fetchNews(
        query: _query, // Passando o termo de pesquisa
        page: _currentPage,
      );

      setState(() {
        if (isLoadMore) {
          _articles.addAll(fetchedArticles);
        } else {
          _articles = fetchedArticles;
        }
      });
    } catch (e) {
      print('Erro ao buscar notícias: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      _currentPage++;
      _fetchNews(isLoadMore: true);
    }
  }

  void _onSearch(String query) {
    setState(() {
      _query = query;
      _currentPage = 1;
      _articles = [];
    });
    _fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: 'Pesquise por notícias...',
          ),
          onSubmitted: _onSearch,
        ),
      ),
      body: _articles.isEmpty && !_isLoading
          ? const Center(child: Text('Nenhuma notícia encontrada.'))
          : ListView.builder(
        controller: _scrollController,
        itemCount: _articles.length,
        itemBuilder: (context, index) {
          final article = _articles[index];
          return ListTile(
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
