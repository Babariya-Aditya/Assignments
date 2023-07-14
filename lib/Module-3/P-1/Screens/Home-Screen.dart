import 'package:assignment_1/Module-3/P-1/Screens/Search%20Screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("Home"),actions: [IconButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage(),));
        
      }, icon:Icon(Icons.search)),PopupMenuButton(itemBuilder: (context) => [
        PopupMenuItem(child: Text("cart")),
        PopupMenuItem(child: Text("profile")),
        PopupMenuItem(child: Text("Logout")),
      ],)]),
    );
  }
}
