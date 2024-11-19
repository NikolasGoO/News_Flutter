class Article {
  final String title;
  final String description;
  final String imageUrl;
  final String content;
  final String url;
  final Source source;
  final String? author;
  final String publishedAt;

  Article({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.content,
    required this.url,
    required this.source,
    this.author,
    required this.publishedAt,
  });

  // Converte JSON da API para o objeto Article
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: (json['title'] as String?) ?? 'Sem título',
      description: (json['description'] as String?) ?? 'Sem descrição',
      author: (json['author'] as String?) ?? 'Autor desconhecido',
      publishedAt: (json['publishedAt'] as String?) ?? 'Data desconhecida',
      imageUrl: (json['urlToImage'] as String?) ?? '',
      content: (json['content'] as String?) ?? 'Sem conteúdo disponível',
      url: (json['url'] as String?) ?? '',
      source: Source.fromJson(json['source'] ?? {}),
    );
  }
}

class Source {
  final String name;

  Source({required this.name});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      name: json['name'] ?? 'Fonte desconhecida',
    );
  }
}
