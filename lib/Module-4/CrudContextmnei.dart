import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MaterialApp(
    home: ContextMenuListView(),
  ));
}

class ContextMenuListView extends StatefulWidget {
  @override
  _ContextMenuListViewState createState() => _ContextMenuListViewState();
}

class _ContextMenuListViewState extends State<ContextMenuListView> {
  List<String> items = List.generate(5, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListView with Context Menu')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            trailing: PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'View') {
                  _viewItem(items[index]);
                } else if (value == 'Edit') {
                  _editItem(index);
                } else if (value == 'Delete') {
                  _deleteItem(index);
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'View',
                  child: Text('View'),
                ),
                PopupMenuItem(
                  value: 'Edit',
                  child: Text('Edit'),
                ),
                PopupMenuItem(
                  value: 'Delete',
                  child: Text('Delete'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // View operation: Shows a toast message with the item details
  void _viewItem(String item) {
    Fluttertoast.showToast(
      msg: "Viewing $item",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  // Edit operation: Updates the item's name with " (Edited)"
  void _editItem(int index) {
    setState(() {
      items[index] = "${items[index]} (Edited)";
    });
    Fluttertoast.showToast(
      msg: "Edited ${items[index]}",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.orange,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  // Delete operation: Removes the item from the list
  void _deleteItem(int index) {
    String deletedItem = items[index];
    setState(() {
      items.removeAt(index);
    });
    Fluttertoast.showToast(
      msg: "$deletedItem deleted",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
