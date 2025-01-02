<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>News App</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      line-height: 1.6;
      margin: 0;
      padding: 0;
      background-color: #f4f4f9;
      color: #333;
    }
    header {
      background: #0073e6;
      color: white;
      padding: 10px 20px;
      text-align: center;
    }
    header h1 {
      margin: 0;
      font-size: 2.5em;
    }
    .container {
      max-width: 800px;
      margin: 20px auto;
      background: white;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    h2 {
      color: #0073e6;
    }
    ul {
      list-style-type: disc;
      margin: 0;
      padding: 0 20px;
    }
    a {
      color: #0073e6;
      text-decoration: none;
    }
    a:hover {
      text-decoration: underline;
    }
    .button {
      display: inline-block;
      margin-top: 10px;
      padding: 10px 15px;
      background: #0073e6;
      color: white;
      text-decoration: none;
      border-radius: 5px;
      font-weight: bold;
    }
    .button:hover {
      background: #005bb5;
    }
  </style>
</head>
<body>
  <header>
    <h1>News App</h1>
  </header>
  <div class="container">
    <section>
      <h2>📖 Descrição</h2>
      <p>O <strong>News App</strong> é um aplicativo desenvolvido em Flutter para exibir notícias atualizadas de diversas fontes. Ele inclui funcionalidades de busca, exibição de detalhes dos artigos e navegação fluida.</p>
    </section>
    <section>
      <h2>✨ Funcionalidades</h2>
      <ul>
        <li>Exibição de uma lista de artigos com título, imagem e descrição.</li>
        <li>Busca por artigos usando palavras-chave.</li>
        <li>Exibição de detalhes de um artigo, incluindo conteúdo completo, fonte e data de publicação.</li>
        <li>Abertura do artigo completo em um navegador externo.</li>
      </ul>
    </section>
    <section>
      <h2>⚙️ Pré-requisitos</h2>
      <ul>
        <li>Flutter SDK instalado (<a href="https://flutter.dev/docs/get-started/install" target="_blank">Guia de instalação</a>).</li>
        <li>Editor de código, como Visual Studio Code ou Android Studio.</li>
        <li>API Key da <a href="https://newsapi.org/" target="_blank">News API</a> (necessária para acessar os dados).</li>
      </ul>
    </section>
    <section>
      <h2>🚀 Instalação</h2>
      <ol>
        <li>Clone este repositório:</li>
        <pre><code>git clone https://github.com/seu-usuario/news-app.git</code></pre>
        <li>Navegue até o diretório do projeto:</li>
        <pre><code>cd news-app</code></pre>
        <li>Adicione sua API Key no arquivo <code>news_service.dart</code>.</li>
        <li>Execute o comando para instalar as dependências:</li>
        <pre><code>flutter pub get</code></pre>
      </ol>
    </section>
    <section>
      <h2>📱 Uso</h2>
      <ol>
        <li>Inicie o projeto:</li>
        <pre><code>flutter run</code></pre>
        <li>Selecione seu dispositivo ou emulador para executar o aplicativo.</li>
        <li>Explore as notícias disponíveis e use a barra de busca para encontrar artigos específicos.</li>
      </ol>
    </section>
    <section>
      <h2>🛠️ Tecnologias Utilizadas</h2>
      <ul>
        <li><strong>Flutter</strong>: Framework para desenvolvimento de aplicativos multiplataforma.</li>
        <li><strong>News API</strong>: API para acessar notícias de várias fontes.</li>
        <li><strong>Intl</strong>: Biblioteca para formatação de datas.</li>
        <li><strong>url_launcher</strong>: Plugin Flutter para abrir URLs no navegador.</li>
      </ul>
    </section>
    <section>
      <h2>📜 Licença</h2>
      <p>Este projeto está licenciado sob a <a href="https://opensource.org/licenses/MIT" target="_blank">Licença MIT</a>.</p>
    </section>
    <footer>
      <p>Feito com ❤️ por <a href="https://github.com/NikolasGoO" target="_blank">Nikolas G.</a></p>
    </footer>
  </div>
</body>
</html>
