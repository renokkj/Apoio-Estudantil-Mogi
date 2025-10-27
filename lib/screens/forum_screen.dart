import 'package:flutter/material.dart';

class ForumScreen extends StatefulWidget {
  const ForumScreen({Key? key}) : super(key: key);

  @override
  State<ForumScreen> createState() => _ForumScreenState();
}

class _ForumScreenState extends State<ForumScreen> {
  final List<String> _categories = [
    'Todos',
    'Dúvidas',
    'Discussões',
    'Materiais',
    'Eventos',
  ];

  String _selectedCategory = 'Todos';

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
                    'Fórum',
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

            // Filtro de categorias
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  final category = _categories[index];
                  final isSelected = category == _selectedCategory;
                  
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FilterChip(
                      label: Text(category),
                      selected: isSelected,
                      onSelected: (selected) {
                        setState(() {
                          _selectedCategory = category;
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

            // Lista de discussões
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
                  _buildDiscussionCard(
                    context,
                    'Como resolver equações do 2º grau?',
                    'Estou com dificuldade em resolver equações do 2º grau. Alguém poderia me ajudar com um passo a passo?',
                    'Maria Silva',
                    '2 horas atrás',
                    15,
                    8,
                    'Matemática',
                  ),
                  const SizedBox(height: 16),
                  _buildDiscussionCard(
                    context,
                    'Dicas para redação do ENEM',
                    'Quais são as melhores dicas para conseguir uma boa nota na redação do ENEM? Estou estudando bastante, mas ainda tenho dificuldades.',
                    'João Santos',
                    '5 horas atrás',
                    32,
                    20,
                    'Português',
                  ),
                  const SizedBox(height: 16),
                  _buildDiscussionCard(
                    context,
                    'Alguém tem o gabarito da ETEC 2023?',
                    'Estou procurando o gabarito da prova da ETEC de 2023. Alguém tem e poderia compartilhar?',
                    'Pedro Oliveira',
                    '1 dia atrás',
                    8,
                    3,
                    'Vestibular',
                  ),
                  const SizedBox(height: 16),
                  _buildDiscussionCard(
                    context,
                    'Grupo de estudos para o ENEM',
                    'Estou montando um grupo de estudos para o ENEM. Alguém tem interesse em participar? Vamos nos reunir na biblioteca municipal aos sábados.',
                    'Ana Costa',
                    '2 dias atrás',
                    45,
                    30,
                    'Eventos',
                  ),
                  const SizedBox(height: 16),
                  _buildDiscussionCard(
                    context,
                    'Dúvida sobre mitocôndria',
                    'Qual é a função exata da mitocôndria na célula? Estou confuso com as explicações do livro.',
                    'Lucas Ferreira',
                    '3 dias atrás',
                    12,
                    7,
                    'Biologia',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implementar criação de nova discussão
        },
        backgroundColor: const Color(0xFF6A35FF),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildDiscussionCard(
    BuildContext context,
    String title,
    String content,
    String author,
    String time,
    int likes,
    int comments,
    String tag,
  ) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tag da discussão
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF6A35FF).withOpacity(0.1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                tag,
                style: const TextStyle(
                  color: Color(0xFF6A35FF),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 12),
            
            // Título da discussão
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333),
              ),
            ),
            const SizedBox(height: 8),
            
            // Conteúdo da discussão
            Text(
              content,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),
            
            // Autor e tempo
            Row(
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundColor: const Color(0xFF6A35FF),
                  child: Text(
                    author.substring(0, 1),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  author,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF333333),
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
                  time,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            
            // Likes e comentários
            Row(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.thumb_up_outlined,
                      size: 16,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(width: 4),
                    Text(
                      likes.toString(),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                Row(
                  children: [
                    Icon(
                      Icons.comment_outlined,
                      size: 16,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(width: 4),
                    Text(
                      comments.toString(),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    // Implementar visualização da discussão
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFF6A35FF),
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(0, 0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text(
                    'Ver mais',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
