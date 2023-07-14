import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Material App',
      home:P2()
    );
  }
}
class P2  extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text("Alert Dialog Box",)),
      floatingActionButton: FloatingActionButton(onPressed: () {
        getDialog(context);
      },child: Icon(Icons.add,)),
    );
  }
   Future getDialog(BuildContext context) {
    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("Logout"),
        content: Text("Are you sure?"),
        actions: [
          TextButton(onPressed: () {
          }, child: Text("OK")),
          TextButton(onPressed: () {
          }, child: Text("Cancel"))
        ],
      );
    },);
  }
}

