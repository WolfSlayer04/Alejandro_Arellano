import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/network_image_grid.dart';
import 'widgets/hero_image_list.dart';
import 'widgets/cached_image_grid.dart';

class ImagesPage extends StatelessWidget {
  const ImagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Imágenes Mejoradas',
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Imágenes de Red'),
              Tab(text: 'Imágenes Hero'),
              Tab(text: 'Imágenes en Caché'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            NetworkImageGrid(),
            HeroImageList(),
            CachedImageGrid(),
          ],
        ),
      ),
    );
  }
}