import 'package:flutter/material.dart';

class FilmeCard extends StatelessWidget {
  final String titulo;
  final String sinopse;
  final String imagem;
  final double avaliacao;
  final String comentario;

  const FilmeCard({
    super.key,
    required this.titulo,
    required this.sinopse,
    required this.imagem,
    required this.avaliacao,
    required this.comentario,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF202020),
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imagem,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 200,
                color: Colors.grey[800],
                alignment: Alignment.center,
                child: const Icon(
                  Icons.movie,
                  size: 60,
                  color: Colors.white54,
                ),
              );
            },
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  sinopse,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 12),

                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '$avaliacao / 10',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                Text(
                  '💬 $comentario',
                  style: const TextStyle(
                    color: Colors.lightBlueAccent,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}