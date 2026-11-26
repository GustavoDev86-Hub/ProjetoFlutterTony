
import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final _formKey = GlobalKey<FormState>();

  final tituloController = TextEditingController();
  final sinopseController = TextEditingController();
  final imagemController = TextEditingController();
  final avaliacaoController = TextEditingController();
  final comentarioController = TextEditingController();

  @override
  void dispose() {
    tituloController.dispose();
    sinopseController.dispose();
    imagemController.dispose();
    avaliacaoController.dispose();
    comentarioController.dispose();
    super.dispose();
  }

  void cadastrarFilme() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Filme cadastrado com sucesso!'),
          backgroundColor: Colors.green,
        ),
      );

      _formKey.currentState!.reset();

      tituloController.clear();
      sinopseController.clear();
      imagemController.clear();
      avaliacaoController.clear();
      comentarioController.clear();
    }
  }

  Widget campoTexto({
    required String label,
    required TextEditingController controller,
    int maxLines = 1,
    TextInputType? keyboardType,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboardType,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white70),
          filled: true,
          fillColor: Colors.grey[900],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Preencha este campo';
          }
          return null;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text('Painel Administrativo'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Cadastrar novo filme',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),

              campoTexto(
                label: 'Título do filme',
                controller: tituloController,
              ),

              campoTexto(
                label: 'Sinopse',
                controller: sinopseController,
                maxLines: 4,
              ),

              campoTexto(
                label: 'URL da imagem',
                controller: imagemController,
              ),

              campoTexto(
                label: 'Avaliação (0 a 10)',
                controller: avaliacaoController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),

              campoTexto(
                label: 'Comentário ou dica',
                controller: comentarioController,
                maxLines: 3,
              ),

              const SizedBox(height: 10),

              ElevatedButton.icon(
                onPressed: cadastrarFilme,
                icon: const Icon(Icons.add),
                label: const Text('Cadastrar filme'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
