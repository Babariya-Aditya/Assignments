import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'URL Launcher Example',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final String phoneNumber = '1234567890'; // Replace with the desired phone number
  final String smsNumber = '1234567890';   // Replace with the desired phone number
  final String smsMessage = 'Hello, this is a test message!';

  Future<void> _makePhoneCall() async {
    final Uri url = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunch(url.toString())) {
      await launch(url.toString());
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _sendSMS() async {
    final Uri url = Uri(
      scheme: 'sms',
      path: smsNumber,
      queryParameters: {'body': smsMessage},
    );
    if (await canLaunch(url.toString())) {
      await launch(url.toString());
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('URL Launcher Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _makePhoneCall,
              child: Text('Call $phoneNumber'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _sendSMS,
              child: Text('Send SMS to $smsNumber'),
            ),
          ],
        ),
      ),
    );
  }
}
