import 'package:flutter/material.dart';

class ComponentsTab extends StatelessWidget {
  const ComponentsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          child: ListTile(
            leading: const Icon(Icons.star),
            title: const Text('Elementos Destacados'),
            trailing: Chip(
              label: const Text('Nuevo'),
              backgroundColor: Theme.of(context).primaryColor,
              labelStyle: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Card(
          child: ExpansionTile(
            leading: const Icon(Icons.info),
            title: const Text('Elemento Expandible'),
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text('Este es el contenido expandido'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.thumb_up),
                      onPressed: () {},
                    ),
                    const Text('Me gusta'),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.share),
                      onPressed: () {},
                    ),
                    const Text('Compartir'),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.bookmark),
                      onPressed: () {},
                    ),
                    const Text('Guardar'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}