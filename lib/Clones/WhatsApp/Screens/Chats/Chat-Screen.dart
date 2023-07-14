import 'package:assignment_1/Clones/WhatsApp/Screens/Chats/chat.dart';
import 'package:flutter/material.dart';

import '../../Modals/User.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var UserList = <User>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UserList.add(User(
        title: "Aditya",
        Subtitle: "Calm And Cool",
        time: "10:10 AM",
        number: 2));
    UserList.add(User(
        title: "Parin", Subtitle: "Happy Happy", time: "11:00 PM", number: 10));
    UserList.add(User(
        title: "Sujal",
        Subtitle: "Calm And Happy",
        time: "5:50 PM",
        number: 4));
    UserList.add(User(
        title: "Kinnar",
        Subtitle: "Sleepy and Sleepy",
        time: "yesterday",
        number: 5));
    UserList.add(User(
        title: "Megh",
        Subtitle: "Sleepy as always",
        time: "yesterday",
        number: 1));
    UserList.add(User(
        title: "Pujan",
        Subtitle: "Speedy and energetic",
        time: "yesterday",
        number: 150));
    UserList.add(User(
        title: "Aditya",
        Subtitle: "Calm And Cool",
        time: "20/05/23",
        number: 2));
    UserList.add(User(
        title: "Parin", Subtitle: "Happy Happy", time: "11:00 PM", number: 10));
    UserList.add(User(
        title: "Sujal",
        Subtitle: "Calm And Happy",
        time: "20/05/23",
        number: 4));
    UserList.add(User(
        title: "Kinnar",
        Subtitle: "Sleepy and Sleepy",
        time: "01:10 AM",
        number: 5));
    UserList.add(User(
        title: "Megh",
        Subtitle: "  Sleepy as always",
        time: "05:00 PM",
        number: 1));
    UserList.add(User(
        title: "Pujan",
        Subtitle: "Speedy and energetic",
        time: "11:00 AM",
        number: 150));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff131C2C),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff00AF80),
        child: Icon(Icons.message_sharp,size: size.width*.08),
        onPressed: () {},
      ),
      body: ListView.builder(
        itemCount: UserList.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              var user =User(title:UserList[index].title , Subtitle: UserList[index].Subtitle, time: UserList[index].time, number:UserList[index].number);
              Navigator.push(context, MaterialPageRoute(builder: (context) => Chats(user),));
            },
            tileColor: Color(0xff131C2C),
            leading: CircleAvatar(
              radius: size.width*.07,
                backgroundColor: Colors.black,
                child: UserList[index].title != null
                    ? Text(
                        UserList[index].title[0],
                      )
                    : Icon(Icons.person)),
            title: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(UserList[index].title,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: size.width*.048)),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(UserList[index].Subtitle,
                  style: TextStyle(color: Colors.white, fontSize: size.width*.038)),
            ),
            trailing: Container(
              width: size.width * .2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(UserList[index].time,
                      style: TextStyle(color: Colors.grey)),
                  SizedBox(
                    width: size.width * .03,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.volume_off_sharp, color: Colors.grey,size: size.width*.06),
                      SizedBox(
                        width: size.width * .02,
                      ),
                      CircleAvatar(
                        radius: size.width*.028,
                        backgroundColor: Color(0xff00AF80),
                        child: Text("${UserList[index].number}",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
