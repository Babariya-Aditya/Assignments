import 'package:assignment_1/Clones/WhatsApp/Screens/Calls-Screen.dart';
import 'package:assignment_1/Clones/WhatsApp/Screens/Chats/Chat-Screen.dart';
import 'package:assignment_1/Clones/WhatsApp/Screens/Status-Screen.dart';
import 'package:flutter/material.dart';

import 'Community-Screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
        length: 4,
        initialIndex: 1,
        child: Scaffold(

            appBar: AppBar(
                elevation: 0,
                backgroundColor: Color(0xff222C34),
                title: Text("WhatsApp",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: size.width*.052,
                        fontWeight: FontWeight.w500)),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.camera_alt_outlined, size: size.width*.072),
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search, size:  size.width*.072),
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: Container(
                      child: PopupMenuButton(
                        color: Color(0xff222C34),
                        icon: Icon(Icons.more_vert_outlined,
                            size:  size.width*.072, color: Colors.grey),
                        itemBuilder: (context) {
                          return [
                            const PopupMenuItem(
                                child: Text(
                              "New group",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            )),
                            const PopupMenuItem(
                                child: Text(
                              "New broadcast",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            )),
                            const PopupMenuItem(
                                child: Text(
                              "Linked devices",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            )),
                            const PopupMenuItem(
                                child: Text(
                              "Starred messages",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            )),
                            const PopupMenuItem(
                                child: Text(
                              "Payments",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            )),
                            PopupMenuItem(
                                child: Text(
                              "Settings",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ))
                          ];
                        },
                      ),
                    ),
                  )
                ]),
            body: SafeArea(
              child: Container(
                child: Column(children: [
                  Container(
                    color: Color(0xff222C34),
                    child: TabBar(
                      isScrollable: true,
                      indicatorWeight: 3,
                      labelColor: Color(0xff00AF80),
                      unselectedLabelColor: Colors.grey,
                      labelStyle: TextStyle(fontSize: size.width*.042,fontWeight: FontWeight.bold),
                      indicatorColor: Color(0xff00AF80),
                      tabs: [
                        Container(
                          width: size.width * .07,
                          child: Tab(
                            icon: Icon(Icons.groups),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: size.width * .2,
                          child: Tab(
                            child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [ Text("Chats"),CircleAvatar(
                              backgroundColor: Color(0xff00AF80),
                              radius: size.width*.027,
                              child: Text("10",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
                            )],)
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: size.width * .2,
                          child: Tab(
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [Text("Status"),CircleAvatar(radius: size.width*.0075,backgroundColor: Colors.grey,)]),
                          ),
                        ),
                        Container(
                          width: size.width * .21,
                          child: Tab(
                            child: Text("Calls"),
                          ),
                        )
                      ],
                    ),
                  ),
                  Flexible(flex :1, child:TabBarView(children: [
                    CommunityScreen(),
                    ChatScreen(),
                    StatusScreen(),
                    CallScreen()
                  ]) )
                ]),
              ),
            )));
  }
}
