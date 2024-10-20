import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MaterialApp(
    home: ChoiceAlertDialogDemo(),
  ));
}

class ChoiceAlertDialogDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alert Dialog with Choices')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showChoiceAlertDialog(context);
          },
          child: Text('Show Choice Dialog'),
        ),
      ),
    );
  }

  void showChoiceAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose an Option'),
          content: Text('Please select one of the options below.'),
          actions: [
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop();
                showToast('You clicked Yes');
              },
            ),
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
                showToast('You clicked No');
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
                showToast('Action Cancelled');
              },
            ),
          ],
        );
      },
    );
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
