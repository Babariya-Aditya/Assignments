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
                    value: 'Profile',
                    child: Text('  Profile'),
                  ),
                  PopupMenuItem(
                    value: 'Logout',
                    child: Text(' Logout'),
                  ),

                ];
              },
            ),
          ],
        ),
        body: Center(
          child: Text(
            'Tap Menu',
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      ),
    );
  }
}
