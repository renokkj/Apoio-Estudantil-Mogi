import 'package:flutter/material.dart';

class ClassesScreen extends StatefulWidget {
  const ClassesScreen({Key? key}) : super(key: key);

  @override
  State<ClassesScreen> createState() => _ClassesScreenState();
}

class _ClassesScreenState extends State<ClassesScreen> {
  final List<String> _subjects = [
    'Todos',
    'Matemática',
    'Português',
    'História',
    'Geografia',
    'Biologia',
    'Física',
    'Química',
    'Inglês',
  ];

  String _selectedSubject = 'Todos';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cabeçalho
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Videoaulas',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      // Implementar pesquisa
                    },
                  ),
                ],
              ),
            ),

            // Filtro de matérias
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _subjects.length,
                itemBuilder: (context, index) {
                  final subject = _subjects[index];
                  final isSelected = subject == _selectedSubject;
                  
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FilterChip(
                      label: Text(subject),
                      selected: isSelected,
                      onSelected: (selected) {
                        setState(() {
                          _selectedSubject = subject;
                        });
                      },
                      backgroundColor: Colors.grey[200],
                      selectedColor: const Color(0xFF6A35FF).withOpacity(0.2),
                      labelStyle: TextStyle(
                        color: isSelected ? const Color(0xFF6A35FF) : Colors.black,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                      checkmarkColor: const Color(0xFF6A35FF),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // Lista de videoaulas
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
                  _buildVideoCard(
                    context,
                    'Matemática - Funções do 2º Grau',
                    'Prof. Carlos Silva',
                    '45 min',
                    '1.2k visualizações',
                    'assets/images/math_thumbnail.jpg',
                  ),
                  const SizedBox(height: 16),
                  _buildVideoCard(
                    context,
                    'Português - Análise Sintática',
                    'Profa. Ana Oliveira',
                    '38 min',
                    '950 visualizações',
                    'assets/images/portuguese_thumbnail.jpg',
                  ),
                  const SizedBox(height: 16),
                  _buildVideoCard(
                    context,
                    'História - Brasil Império',
                    'Prof. Marcos Santos',
                    '52 min',
                    '820 visualizações',
                    'assets/images/history_thumbnail.jpg',
                  ),
                  const SizedBox(height: 16),
                  _buildVideoCard(
                    context,
                    'Biologia - Sistema Respiratório',
                    'Profa. Juliana Costa',
                    '41 min',
                    '1.5k visualizações',
                    'assets/images/biology_thumbnail.jpg',
                  ),
                  const SizedBox(height: 16),
                  _buildVideoCard(
                    context,
                    'Física - Leis de Newton',
                    'Prof. Ricardo Almeida',
                    '47 min',
                    '1.1k visualizações',
                    'assets/images/physics_thumbnail.jpg',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implementar upload de vídeo
        },
        backgroundColor: const Color(0xFF6A35FF),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildVideoCard(
    BuildContext context,
    String title,
    String author,
    String duration,
    String views,
    String thumbnailPath,
  ) {
    return GestureDetector(
      onTap: () {
        // Implementar reprodução de vídeo
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Usar uma imagem de placeholder quando a imagem real não estiver disponível
                  Container(
                    height: 180,
                    width: double.infinity,
                    color: Colors.grey[300],
                    child: const Icon(
                      Icons.image,
                      size: 50,
                      color: Colors.grey,
                    ),
                  ),
                  // Botão de play
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.play_arrow,
                      color: Color(0xFF6A35FF),
                      size: 30,
                    ),
                  ),
                  // Duração
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        duration,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Informações do vídeo
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        author,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        views,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
