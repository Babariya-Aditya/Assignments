import 'package:assignment_1/Clones/WhatsApp/Modals/User.dart';
import 'package:flutter/material.dart';

class Chats extends StatelessWidget {
  User user;

  Chats(this.user);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff131C2C),
      appBar: AppBar(
          backgroundColor: Color(0xff222C34),
          // appBar: AppBar(centerTitle: true,leading:Row(mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //    // Row(
          //    //   children: [
          //    //     IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back_outlined)),
          //    //   ],
          //    // ),
          //     Row(
          //       children: [

          //       ],
          //     ),
          //   ],
          // ),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                  radius: size.width * .05,
                  backgroundColor: Colors.black,
                  child: user.title != null
                      ? Text(
                          user.title[0],
                        )
                      : Icon(Icons.person)),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Column(
                  children: [
                    Text(user.title,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: size.width * .042)),
                    Text("yesterday",
                        style: TextStyle(
                            color: Colors.white, fontSize: size.width * .034)),
                  ],
                ),
              )
            ],
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.videocam_sharp)),
            IconButton(onPressed: () {}, icon: Icon(Icons.add_ic_call_rounded)),
            Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: Container(
                child: PopupMenuButton(
                  color: Color(0xff222C34),
                  icon: Icon(Icons.more_vert_outlined,
                      size: size.width * .072, color: Colors.white),
                  itemBuilder: (context) {
                    return [
                      const PopupMenuItem(
                          child: Text(
                        "View contact",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      )),
                      const PopupMenuItem(
                          child: Text(
                        "Media,links,and docs",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      )),
                      const PopupMenuItem(
                          child: Text(
                        "Search",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      )),
                      const PopupMenuItem(
                          child: Text(
                        "Mute Notification",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      )),
                      const PopupMenuItem(
                          child: Text(
                        "Disapperaing messages",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      )),
                      PopupMenuItem(
                          child: Text(
                        "Wallpaper",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      )),
                      PopupMenuItem(
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text(
                            "More",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),Icon(Icons.arrow_right,color: Colors.white,)],))
                    ];
                  },
                ),
              ),
            )
          ]),
    );
  }
}
