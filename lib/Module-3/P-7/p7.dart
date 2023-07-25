import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Popup Menu '),
          actions: [
            PopupMenuButton(
              onSelected: (value) {
                print('Selected item: $value');
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    value: 'Linked Devices',
                    child: Text(' Linked Devices'),
                  ),
                  PopupMenuItem(
                    value: 'Payments',
                    child: Text(' Payments'),
                  ),
                  PopupMenuItem(
                    value: 'Settings',
                    child: Text('Settings'),
                  ),
                ];
              },
            ),
          ],
        ),
        body: Center(
          child: Text(
            'Tap the icon in the AppBar to see the popup menu',
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      ),
    );
  }
}
