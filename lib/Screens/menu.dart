

import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (String value) {
        // Handle menu item selection
        print('Selected: $value');
      },
      itemBuilder: (BuildContext context) {
        return [
          const PopupMenuItem(
            value: 'Option 1',
            child: Text('Option 1'),
          ),
          const PopupMenuItem(
            value: 'Option 2',
            child: Text('Option 2'),
          ),
          const PopupMenuItem(
            value: 'Option 3',
            child: Text('Option 3'),
          ),
        ];
      },
      icon: const Icon(Icons.menu), // Use your hamburger icon here
    );
  }
}
