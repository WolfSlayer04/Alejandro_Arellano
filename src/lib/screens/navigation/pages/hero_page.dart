import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroPage extends StatelessWidget {
  const HeroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animación Hero'),
      ),
      body: Center(
        child: Hero(
          tag: 'hero-tag',
          child: Material(
            color: Theme.of(context).primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.animation,
                    color: Colors.white,
                    size: 48,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Widget Hero Animado',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}