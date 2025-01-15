import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontTab extends StatelessWidget {
  final VoidCallback onShowSnackBar;

  const FontTab({
    super.key,
    required this.onShowSnackBar,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Demostración de Fuentes',
              style: GoogleFonts.pacifico(fontSize: 32),
            ),
            const SizedBox(height: 20),
            Text(
              'Fuente Roboto',
              style: GoogleFonts.roboto(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Text(
              'Fuente Lato',
              style: GoogleFonts.lato(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Text(
              'Fuente Montserrat',
              style: GoogleFonts.montserrat(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: onShowSnackBar,
              icon: const Icon(Icons.notifications),
              label: const Text('Mostrar Snackbar'),
            ),
          ],
        ),
      ),
    );
  }
}