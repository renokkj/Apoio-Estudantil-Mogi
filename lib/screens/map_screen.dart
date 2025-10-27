import 'package:flutter/material.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final List<String> _filters = [
    'Todos',
    'Bibliotecas',
    'Wi-Fi Grátis',
    'Espaços de Estudo'
  ];
  String _selectedFilter = 'Todos';

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
                    'Locais de Estudo',
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

            // Barra de pesquisa
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Pesquisar locais',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF5F5F5),
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                ),
                onSubmitted: (value) {
                  // Implementar pesquisa
                },
              ),
            ),
            const SizedBox(height: 16),

            // Filtros
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _filters.length,
                itemBuilder: (context, index) {
                  final filter = _filters[index];
                  final isSelected = filter == _selectedFilter;

                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FilterChip(
                      label: Text(filter),
                      selected: isSelected,
                      onSelected: (selected) {
                        setState(() {
                          _selectedFilter = filter;
                        });
                      },
                      backgroundColor: Colors.grey[200],
                      selectedColor: const Color(0xFF6A35FF).withOpacity(0.2),
                      labelStyle: TextStyle(
                        color:
                            isSelected ? const Color(0xFF6A35FF) : Colors.black,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                      checkmarkColor: const Color(0xFF6A35FF),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // Mapa simulado
            Expanded(
              child: Stack(
                children: [
                  // Imagem simulada do mapa
                  Container(
                    color: Colors.grey[200],
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.map,
                            size: 64,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Mapa de Mogi das Cruzes',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Filtro selecionado: $_selectedFilter',
                            style: TextStyle(
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Marcadores simulados
                  Positioned(
                    top: 100,
                    left: 100,
                    child: _buildMapMarker(
                      'Biblioteca Municipal',
                      'Biblioteca',
                      Icons.menu_book,
                    ),
                  ),
                  Positioned(
                    top: 200,
                    right: 120,
                    child: _buildMapMarker(
                      'Praça da Cidadania',
                      'Wi-Fi Grátis',
                      Icons.wifi,
                    ),
                  ),
                  Positioned(
                    bottom: 150,
                    left: 150,
                    child: _buildMapMarker(
                      'Centro Cultural',
                      'Espaço de Estudo',
                      Icons.school,
                    ),
                  ),
                  Positioned(
                    bottom: 200,
                    right: 80,
                    child: _buildMapMarker(
                      'Biblioteca ETEC',
                      'Biblioteca',
                      Icons.menu_book,
                    ),
                  ),
                ],
              ),
            ),

            // Lista de locais próximos
            Container(
              height: 200,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Locais Próximos',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildNearbyPlaceCard(
                          'Biblioteca Municipal',
                          'Rua Exemplo, 123',
                          '1.2 km',
                          Icons.menu_book,
                          Colors.blue,
                        ),
                        _buildNearbyPlaceCard(
                          'Praça da Cidadania',
                          'Av. Principal, 456',
                          '0.8 km',
                          Icons.wifi,
                          Colors.green,
                        ),
                        _buildNearbyPlaceCard(
                          'Centro Cultural',
                          'Rua das Artes, 789',
                          '1.5 km',
                          Icons.school,
                          Colors.orange,
                        ),
                        _buildNearbyPlaceCard(
                          'Biblioteca ETEC',
                          'Av. Educação, 321',
                          '2.0 km',
                          Icons.menu_book,
                          Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMapMarker(String name, String type, IconData icon) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Local selecionado: $name'),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF6A35FF),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNearbyPlaceCard(
    String name,
    String address,
    String distance,
    IconData icon,
    Color color,
  ) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Local selecionado: $name'),
              ),
            );
          },
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        icon,
                        color: color,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  address,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 14,
                      color: const Color(0xFF6A35FF),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      distance,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF6A35FF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Navegando para: $name'),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6A35FF),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 32),
                    padding: EdgeInsets.zero,
                  ),
                  child: const Text('COMO CHEGAR'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
