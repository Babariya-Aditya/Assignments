import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ExitConfirmationDemo(),
  ));
}

class ExitConfirmationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool shouldExit = await showExitConfirmationDialog(context);
        return shouldExit; // Return true to exit, false to stay
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Exit Confirmation')),
        body: Center(
          child: Text(
            'Press the back button to exit.',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }

  // Function to show the exit confirmation dialog
  Future<bool> showExitConfirmationDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Exit Application'),
          content: Text('Are you sure you want to exit?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(false); // Stay in the app
              },
            ),
            TextButton(
              child: Text('Exit'),
              onPressed: () {
                Navigator.of(context).pop(true); // Exit the app
              },
            ),
          ],
        );
      },
    ) ?? false;
  }
}
