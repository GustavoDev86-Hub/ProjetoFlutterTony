import 'package:flutter/material.dart';
import 'widgets/filme_card.dart';

void main() {
  runApp(const DicasDeFilmesApp());
}

class DicasDeFilmesApp extends StatelessWidget {
  const DicasDeFilmesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dicas de Filmes',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121212),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final filmes = [
      {
        'titulo': 'Interestelar',
        'sinopse': 'Uma equipe de exploradores viaja além desta galáxia em busca de um novo lar para a humanidade.',
        'imagem': 'https://image.tmdb.org/t/p/w500/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg',
        'avaliacao': 9.5,
        'comentario': 'Um dos melhores filmes de ficção científica já feitos!'
      },
      {
        'titulo': 'Batman: O Cavaleiro das Trevas',
        'sinopse': 'Batman enfrenta seu maior desafio quando o Coringa espalha o caos por Gotham.',
        'imagem': 'https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg',
        'avaliacao': 9.0,
        'comentario': 'Uma obra-prima do cinema de super-heróis.'
      },
      {
        'titulo': 'A Origem',
        'sinopse': 'Um ladrão especializado em invadir sonhos recebe uma missão quase impossível.',
        'imagem': 'https://image.tmdb.org/t/p/w500/oYuLEt3zVCKq57qu2F8dT7NIa6f.jpg',
        'avaliacao': 9.2,
        'comentario': 'Um filme que faz você pensar até depois dos créditos!'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        title: const Text(
          '🎬 Dicas de Filmes',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Descubra seu próximo filme favorito!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Confira nossas recomendações.',
            style: TextStyle(
              color: Colors.white60,
            ),
          ),

          const SizedBox(height: 20),

          ...filmes.map((filme) {
            return FilmeCard(
              titulo: filme['titulo'] as String,
              sinopse: filme['sinopse'] as String,
              imagem: filme['imagem'] as String,
              avaliacao: filme['avaliacao'] as double,
              comentario: filme['comentario'] as String,
            );
          }),
        ],
      ),
    );
  }
}

