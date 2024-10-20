import 'package:flutter/material.dart';

class CustomToolbar extends StatefulWidget {
  @override
  _CustomToolbarState createState() => _CustomToolbarState();
}

class _CustomToolbarState extends State<CustomToolbar> {
  String selectedValue = 'Option 1'; // Default spinner value
  final List<String> items = ['Option 1', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropdownButton<String>(
              value: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value!;
                });
              },
              items: items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                ),
                onChanged: (text) {
                  print('Search: $text');
                },
              ),
            ),
          ],
        ),
      ),
      body: Center(child: Text('Toolbar with Spinner and Search')),
    );
  }
}

void main() => runApp(MaterialApp(home: CustomToolbar()));
