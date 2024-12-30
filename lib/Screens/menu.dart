

import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  String _sortBy = "Number";
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sort by:",
            style: TextStyle(
              color: Colors.red,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          RadioListTile<String>(
            title: Text(
              "Number",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            value: "Number",
            groupValue: _sortBy,
            activeColor: Colors.red,
            onChanged: (value) {
              setState(() {
                _sortBy = value!;
              });
            },
          ),
          RadioListTile<String>(
            title: Text(
              "Name",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            value: "Name",
            groupValue: _sortBy,
            activeColor: Colors.red,
            onChanged: (value) {
              setState(() {
                _sortBy = value!;
              });
            },
          ),
        ],
      ),
    );
  }
}
