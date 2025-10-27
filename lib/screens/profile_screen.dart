import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cabeçalho do perfil
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // Avatar e informações básicas
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: const Color(0xFF6A35FF),
                            child: const Text(
                              'E',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Estudante',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'estudante@email.com',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'E.E. Coronel Almeida',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Pontuação
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFF6A35FF).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber[700],
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              '250 pontos',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF6A35FF),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Botão de editar perfil
                      OutlinedButton.icon(
                        onPressed: () {
                          // Implementar edição de perfil
                        },
                        icon: const Icon(Icons.edit),
                        label: const Text('Editar Perfil'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFF6A35FF),
                          side: const BorderSide(color: Color(0xFF6A35FF)),
                          minimumSize: const Size(double.infinity, 40),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Estatísticas
              Text(
                'Estatísticas',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      context,
                      'Downloads',
                      '15',
                      Icons.download,
                      Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildStatCard(
                      context,
                      'Contribuições',
                      '8',
                      Icons.upload_file,
                      Colors.green,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildStatCard(
                      context,
                      'Favoritos',
                      '23',
                      Icons.favorite,
                      Colors.red,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Meus Downloads
              Text(
                'Meus Downloads',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  final downloads = [
                    'Resumo de Matemática - Funções.pdf',
                    'Prova ETEC 2023 - Química.pdf',
                    'Exercícios de Física - Leis de Newton.pdf',
                  ];
                  return ListTile(
                    leading: const Icon(
                      Icons.picture_as_pdf,
                      color: Colors.red,
                    ),
                    title: Text(downloads[index]),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // Implementar abertura do arquivo
                    },
                  );
                },
              ),
              const SizedBox(height: 24),

              // Minhas Contribuições
              Text(
                'Minhas Contribuições',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) {
                  final contributions = [
                    'Resumo de História - Brasil Império.pdf',
                    'Exercícios de Português - Análise Sintática.pdf',
                  ];
                  return ListTile(
                    leading: const Icon(
                      Icons.upload_file,
                      color: Colors.green,
                    ),
                    title: Text(contributions[index]),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // Implementar abertura do arquivo
                    },
                  );
                },
              ),
              const SizedBox(height: 24),

              // Configurações
              Text(
                'Configurações',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    _buildSettingTile(
                      context,
                      'Notificações',
                      Icons.notifications,
                      () {
                        // Implementar configurações de notificações
                      },
                    ),
                    const Divider(height: 1),
                    _buildSettingTile(
                      context,
                      'Privacidade',
                      Icons.lock,
                      () {
                        // Implementar configurações de privacidade
                      },
                    ),
                    const Divider(height: 1),
                    _buildSettingTile(
                      context,
                      'Modo Offline',
                      Icons.offline_bolt,
                      () {
                        // Implementar configurações de modo offline
                      },
                    ),
                    const Divider(height: 1),
                    _buildSettingTile(
                      context,
                      'Ajuda e Suporte',
                      Icons.help,
                      () {
                        // Implementar ajuda e suporte
                      },
                    ),
                    const Divider(height: 1),
                    _buildSettingTile(
                      context,
                      'Sobre o App',
                      Icons.info,
                      () {
                        // Implementar sobre o app
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(
              icon,
              color: color,
              size: 32,
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingTile(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Icon(
        icon,
        color: const Color(0xFF6A35FF),
      ),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
