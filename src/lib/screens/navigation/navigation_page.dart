import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/second_page.dart';
import 'pages/data_page.dart';
import 'pages/selection_page.dart';
import 'pages/hero_page.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Navegación Mejorada',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildNavigationCard(
              context,
              'Navegación Básica',
              'Navegar a una nueva página y regresar',
              Icons.navigate_next,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondPage()),
                );
              },
            ),
            const SizedBox(height: 16),
            _buildNavigationCard(
              context,
              'Navegación con Datos',
              'Pasar datos a una nueva página',
              Icons.send,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DataPage(
                      data: 'Datos enviados desde la página de navegación',
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            _buildNavigationCard(
              context,
              'Navegación con Resultado',
              'Obtener resultado de una página',
              Icons.how_to_vote,
              () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SelectionPage()),
                );
                if (result != null && context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Seleccionado: $result'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 16),
            _buildNavigationCard(
              context,
              'Navegación Animada',
              'Animación Hero entre páginas',
              Icons.animation,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HeroPage()),
                );
              },
              isHero: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    VoidCallback onPressed, {
    bool isHero = false,
  }) {
    final button = ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text('Probar'),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16),
      ),
    );

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(subtitle),
            const SizedBox(height: 16),
            Center(
              child: isHero
                  ? Hero(
                      tag: 'hero-tag',
                      child: button,
                    )
                  : button,
            ),
          ],
        ),
      ),
    );
  }
}