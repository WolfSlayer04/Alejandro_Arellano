import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/interactive_list.dart';
import 'widgets/grid_gallery.dart';
import 'widgets/horizontal_list.dart';
import 'widgets/mixed_content.dart';

class ListsPage extends StatelessWidget {
  const ListsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Listas Mejoradas',
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          ),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Lista Interactiva'),
              Tab(text: 'Galería Grid'),
              Tab(text: 'Lista Horizontal'),
              Tab(text: 'Contenido Mixto'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            InteractiveList(),
            GridGallery(),
            HorizontalList(),
            MixedContent(),
          ],
        ),
      ),
    );
  }
}