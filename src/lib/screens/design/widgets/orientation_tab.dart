import 'package:flutter/material.dart';

class OrientationTab extends StatelessWidget {
  const OrientationTab({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        final isLandscape = orientation == Orientation.landscape;
        return Center(
          child: Card(
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    isLandscape ? Icons.screen_lock_landscape : Icons.screen_lock_portrait,
                    size: 48,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    isLandscape ? 'Modo Paisaje' : 'Modo Retrato',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Ancho: ${MediaQuery.of(context).size.width.toStringAsFixed(1)}\n'
                    'Alto: ${MediaQuery.of(context).size.height.toStringAsFixed(1)}',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}