import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/font_tab.dart';
import 'widgets/theme_tab.dart';
import 'widgets/orientation_tab.dart';
import 'widgets/components_tab.dart';

class DesignPage extends StatefulWidget {
  const DesignPage({super.key});

  @override
  State<DesignPage> createState() => _DesignPageState();
}

class _DesignPageState extends State<DesignPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('¡Este es un snackbar mejorado!'),
        action: SnackBarAction(
          label: 'Deshacer',
          onPressed: () {},
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(8),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        brightness: _isDarkMode ? Brightness.dark : Brightness.light,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Ejemplos de Diseño',
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
              onPressed: () {
                setState(() {
                  _isDarkMode = !_isDarkMode;
                });
              },
            ),
          ],
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            tabs: const [
              Tab(icon: Icon(Icons.font_download), text: 'Fuentes'),
              Tab(icon: Icon(Icons.palette), text: 'Temas'),
              Tab(icon: Icon(Icons.screen_rotation), text: 'Orientación'),
              Tab(icon: Icon(Icons.widgets), text: 'Componentes'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            FontTab(onShowSnackBar: _showSnackBar),
            const ThemeTab(),
            const OrientationTab(),
            const ComponentsTab(),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _showSnackBar,
          icon: const Icon(Icons.add),
          label: const Text('Agregar'),
        ),
      ),
    );
  }
}