import 'package:flutter/material.dart';

void main() {
  runApp(NameListApp());
}

class NameListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Name List App',
      home: NameListScreen(),
    );
  }
}

class NameListScreen extends StatefulWidget {
  @override
  _NameListScreenState createState() => _NameListScreenState();
}

class _NameListScreenState extends State<NameListScreen> {
  final TextEditingController _nameController = TextEditingController();
  final List<String> _names = [];

  void _addName() {
    if (_nameController.text.isNotEmpty) {
      setState(() {
        _names.add(_nameController.text);
        _nameController.clear();
      });
    }
  }

  void _showDialog(String name) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Selected Name'),
          content: Text(name),
          actions: [
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showContextMenu(BuildContext context, String name, int index) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(100.0, 100.0, 100.0, 100.0),
      items: [
        PopupMenuItem(
          value: 'edit',
          child: Text('Edit Item'),
        ),
        PopupMenuItem(
          value: 'delete',
          child: Text('Delete Item'),
        ),
        PopupMenuItem(
          value: 'exit',
          child: Text('Exit'),
        ),
      ],
    ).then((value) {
      if (value == 'edit') {
        _editName(index);
      } else if (value == 'delete') {
        _confirmDelete(index);
      } else if (value == 'exit') {
        Navigator.of(context).pop();
      }
    });
  }

  void _editName(int index) {
    _nameController.text = _names[index];
    _addName(); // This will replace the old item with the new item.
    _names.removeAt(index); // Remove old item
    setState(() {}); // Update the list
  }

  void _confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Item'),
          content: Text('Are you sure you want to delete this item?'),
          actions: [
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                setState(() {
                  _names.removeAt(index);
                });
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Name List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Enter a name',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addName,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _names.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onLongPress: () => _showContextMenu(context, _names[index], index),
                    onTap: () => _showDialog(_names[index]),
                    child: Card(
                      child: ListTile(
                        title: Text(_names[index]),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
