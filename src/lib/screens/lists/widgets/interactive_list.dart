import 'package:flutter/material.dart';

class InteractiveList extends StatefulWidget {
  const InteractiveList({super.key});

  @override
  State<InteractiveList> createState() => _InteractiveListState();
}

class _InteractiveListState extends State<InteractiveList> {
  final List<String> _selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        final itemNumber = index + 1;
        final isSelected = _selectedItems.contains(itemNumber.toString());

        return Dismissible(
          key: Key('item_$index'),
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 20),
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          secondaryBackground: Container(
            color: Colors.green,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            child: const Icon(Icons.archive, color: Colors.white),
          ),
          onDismissed: (direction) {
            setState(() {
              // Manejar el descarte
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  direction == DismissDirection.startToEnd
                      ? 'Elemento $itemNumber eliminado'
                      : 'Elemento $itemNumber archivado',
                ),
                action: SnackBarAction(
                  label: 'Deshacer',
                  onPressed: () {
                    // Implementar deshacer
                  },
                ),
              ),
            );
          },
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(itemNumber.toString()),
              ),
              title: Text('Elemento $itemNumber'),
              subtitle: const Text('Desliza para acciones'),
              trailing: IconButton(
                icon: Icon(
                  isSelected ? Icons.check_circle : Icons.circle_outlined,
                  color: isSelected ? Colors.green : null,
                ),
                onPressed: () {
                  setState(() {
                    if (isSelected) {
                      _selectedItems.remove(itemNumber.toString());
                    } else {
                      _selectedItems.add(itemNumber.toString());
                    }
                  });
                },
              ),
            ),
          ),
        );
      },
    );
  }
}