import 'package:flutter/material.dart';

import '../../../Clones/WhatsApp/Screens/Home.dart';
import 'Modals/Bottom.dart';
import 'Screens/NotificationScreen.dart';
import 'Screens/ProfileScreen.dart';
import 'Screens/SearchScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: BottomNav(),
    );
  }
}

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  var itemList = <Bottoms>[];
  var selectIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    itemList
        .add(Bottoms(color: Colors.blue, widget: HomeScreen(), Title: 'Home'));
    itemList.add(
        Bottoms(color: Colors.amber, widget: SearchScreen(), Title: 'Search'));
    itemList.add(Bottoms(
        color: Colors.green,
        widget: NotificationScreen(),
        Title: 'Notification'));
    itemList.add(
        Bottoms(color: Colors.red, widget: ProfileScreen(), Title: 'Profile'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          unselectedIconTheme: IconThemeData(color: Colors.amber),
          selectedIconTheme: IconThemeData(color: Colors.black),
          selectedItemColor: Colors.redAccent,
          unselectedItemColor: Colors.indigoAccent,
          selectedLabelStyle: TextStyle(color: Colors.indigoAccent),
          unselectedLabelStyle: TextStyle(color: Colors.red),
          currentIndex: selectIndex,
          onTap: (value) {
            setState(() {
              selectIndex = value;
            });
          },
          elevation: 20,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
                backgroundColor: itemList[0].color,
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                backgroundColor: itemList[1].color,
                icon: Icon(
                  Icons.search,
                ),
                label: "Search"),
            BottomNavigationBarItem(
                backgroundColor: itemList[2].color,
                icon: Icon(
                  Icons.notification_add,
                ),
                label: "Notification"),
            BottomNavigationBarItem(
                backgroundColor: itemList[3].color,
                icon: Icon(
                  Icons.person,
                ),
                label: "Profile"),
          ]),
      appBar: AppBar(
        backgroundColor: itemList[selectIndex].color,
        title: Text(itemList[selectIndex].Title),
      ),
      body: itemList[selectIndex].widget,
    );
  }
}
