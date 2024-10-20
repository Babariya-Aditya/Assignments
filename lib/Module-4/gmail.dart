import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Gmail-like App',
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gmail-like App'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Search functionality can be added here
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Navigation Bar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InboxScreen()),
                  );
                },
                child: Text('Inbox'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SentScreen()),
                  );
                },
                child: Text('Sent'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DraftsScreen()),
                  );
                },
                child: Text('Drafts'),
              ),
            ],
          ),
          Expanded(child: Center(child: Text('Select a folder above'))),
        ],
      ),
    );
  }
}

class InboxScreen extends StatelessWidget {
  final List<String> inboxEmails = [
    'Email from Alice',
    'Email from Bob',
    'Email from Charlie',
    'Email from David',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inbox')),
      body: ListView.builder(
        itemCount: inboxEmails.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(inboxEmails[index]),
            subtitle: Text('This is a preview of the email content...'),
          );
        },
      ),
    );
  }
}

class SentScreen extends StatelessWidget {
  final List<String> sentEmails = [
    'Sent to Eve',
    'Sent to Frank',
    'Sent to Grace',
    'Sent to Henry',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sent')),
      body: ListView.builder(
        itemCount: sentEmails.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(sentEmails[index]),
            subtitle: Text('This is a preview of the sent email content...'),
          );
        },
      ),
    );
  }
}

class DraftsScreen extends StatelessWidget {
  final List<String> draftEmails = [
    'Draft for Invitation',
    'Draft for Project Update',
    'Draft for Meeting Agenda',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Drafts')),
      body: ListView.builder(
        itemCount: draftEmails.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(draftEmails[index]),
            subtitle: Text('This is a preview of the draft content...'),
          );
        },
      ),
    );
  }
}
