import 'package:flutter/material.dart';

class MixedContent extends StatelessWidget {
  const MixedContent({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 200,
          floating: true,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text('Contenido Mixto'),
            background: Image.network(
              'https://picsum.photos/800/400?image=50',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Contenido Destacado',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Esta es una demostración de diferentes tipos de contenido mezclados en una vista desplazable.',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 1.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Card(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.primaries[index % Colors.primaries.length],
                  child: Text(
                    'Elemento Grid $index',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
            childCount: 6,
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 150.0,
            margin: const EdgeInsets.all(16),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  child: Container(
                    width: 120.0,
                    alignment: Alignment.center,
                    child: Text('Elemento Horizontal $index'),
                  ),
                );
              },
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Card(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text('${index + 1}'),
                  ),
                  title: Text('Elemento Lista ${index + 1}'),
                  subtitle: Text('Subtítulo ${index + 1}'),
                  trailing: const Icon(Icons.arrow_forward),
                ),
              );
            },
            childCount: 10,
          ),
        ),
      ],
    );
  }
}
