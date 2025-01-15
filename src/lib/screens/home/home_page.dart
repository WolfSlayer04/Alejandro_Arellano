import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../config/constants.dart';
import 'widgets/category_card.dart';
import 'widgets/custom_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppConstants.appTitle,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              showAboutDialog(
                context: context,
                applicationName: AppConstants.appTitle,
                applicationVersion: AppConstants.appVersion,
                applicationIcon: CircleAvatar(
                  radius: 25,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: const Text(
                    'AA',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                children: const [
                  Text('Desarrollado por:'),
                  SizedBox(height: 10),
                  Text(
                    AppConstants.developerName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(AppConstants.developerRole),
                  SizedBox(height: 10),
                  Text(
                    'Esta aplicación implementa todos los ejemplos del cookbook de Flutter, '
                    'incluyendo diseño, formularios, imágenes, listas y navegación.',
                  ),
                ],
              );
            },
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.background,
              Theme.of(context).colorScheme.surface,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.1,
            ),
            itemCount: AppConstants.categories.length,
            itemBuilder: (context, index) {
              final category = AppConstants.categories[index];
              return CategoryCard(
                title: category['title'] as String,
                subtitle: category['subtitle'] as String,
                icon: category['icon'] as IconData,
                color: category['color'] as Color,
                onTap: () => Navigator.pushNamed(
                  context,
                  category['route'] as String,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}