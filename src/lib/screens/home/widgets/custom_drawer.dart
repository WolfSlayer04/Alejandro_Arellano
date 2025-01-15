import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../config/constants.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColor.withOpacity(0.8),
            ],
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.5),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  'AA',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              accountName: Text(
                AppConstants.developerName,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                AppConstants.developerRole,
                style: GoogleFonts.poppins(fontSize: 12),
              ),
            ),
            ...AppConstants.categories.map((category) => ListTile(
              leading: Icon(
                category['icon'] as IconData,
                color: Colors.white,
              ),
              title: Text(
                category['title'] as String,
                style: const TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                category['subtitle'] as String,
                style: const TextStyle(color: Colors.white70),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(
                  context,
                  category['route'] as String,
                );
              },
            )),
            const Divider(color: Colors.white24),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.white),
              title: const Text(
                'Configuración',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Implementar configuración
              },
            ),
            ListTile(
              leading: const Icon(Icons.info, color: Colors.white),
              title: const Text(
                'Acerca de',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
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
      ),
    );
  }
}