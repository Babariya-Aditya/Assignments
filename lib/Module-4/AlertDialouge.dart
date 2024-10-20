import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: SimpleAlertDialogDemo(),
  ));
}

class SimpleAlertDialogDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple Alert Dialog Demo')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showSimpleAlertDialog(context);
          },
          child: Text('Show Alert Dialog'),
        ),
      ),
    );
  }

  void showSimpleAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(Icons.info, color: Colors.blue), // Icon in the title
              SizedBox(width: 10),
              Text('Alert'),
            ],
          ),
          content: Text('This is a simple alert dialog with an icon.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }
}
