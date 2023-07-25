import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: NavigtionDrawer()
    );
  }
}

class NavigtionDrawer extends StatelessWidget {
  const NavigtionDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: Text('Material App Bar'),
      ),
      drawer: Drawer(child: Column(children: [
        Container(width: double.infinity,decoration: BoxDecoration(color: Colors.deepPurpleAccent),
          child: DrawerHeader(child: Column(children: [

            CircleAvatar(radius: 45,backgroundImage: AssetImage("assets/images/1.png"),),
            Text("Aditya babariya",style: TextStyle(fontSize: 16),),
            Text("adityababariya@2003gmail.com",style: TextStyle(fontSize: 14),),

          ],)),


        ),
      ListTile(title: Text(""),)],),),
      body: Center(
        child: Container(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
