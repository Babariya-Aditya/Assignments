import 'package:assignment_1/Clones/WhatsApp/Modals/Community.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Modals/User.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({Key? key}) : super(key: key);

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  var CommunityList = <Community>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CommunityList.add(Community(
        title: "Parin Jasani",
        Subtitle: 'Today, 11:45 PM',
        Date: "05/06/23",
        iconData: Icons.account_circle_outlined));
    CommunityList.add(Community(
        title: "Sujal Patoliya",
        Subtitle: 'Yesterday, 12:00 PM',
        Date: "10/06/23",
        iconData: Icons.account_circle_rounded));
    CommunityList.add(Community(
        title: "Aditya Babariya",
        Subtitle: ''
            'Yesterday, 10:45 PM',
        Date: "11/06/23",
        iconData: Icons.accessibility_new));
    CommunityList.add(Community(
        title: "Pujan Bharodiya",
        Subtitle:
        'Yesterday, 11:45 PM',
        Date: "11/06/23",
        iconData: Icons.perm_contact_cal_rounded));
    CommunityList.add(Community(
        title: "Megh Patel",
        Subtitle:
        'Yesterday, 09:00 PM',
        Date: "11/06/23",
        iconData: Icons.person));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold( floatingActionButton: Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: FloatingActionButton(
        backgroundColor: Color(0xff00AF80),
        child: Icon(Icons.phone,color: Colors.white,size: size.width*.08),
        onPressed: () {},
      ),
    ),
        backgroundColor: Color(0xff131C2C),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Create call link",
                        style: TextStyle(fontSize: size.width*.05, color: Colors.white)),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Text("Share a link for your Whatsapp call", style: TextStyle(fontSize: size.width*.04, color: Colors.white)),
                  ),
                  leading: Stack(clipBehavior: Clip.none, children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xff00AF80),
                          borderRadius: BorderRadius.circular(size.width*.14)),
                      height: size.width * .13,
                      width: size.width * .13,
                      child: Icon(
                        Icons.link_outlined,
                        color: Colors.white,
                        size: size.width*.1,
                      ),
                    ),
                  ]),
                ),
              ),
              SizedBox(
                height: size.width * .05,

              ),
              Divider(

                height: 5,
                thickness: 10,
              ),
              Row(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text("Recent ",style: TextStyle(fontSize: size.width*.05,fontWeight: FontWeight.w500,color: Colors.grey)),
                ),
              ],),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: CommunityList.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      children: [
                        SizedBox(height: size.width*.05,),
                        ListTile(
                          tileColor: Color(0xff131C2C),
                          leading:  Stack(clipBehavior: Clip.none, children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(size.width*.14)),
                              height: size.width * .13,
                              width: size.width * .13,
                              child: Icon(
                                CommunityList[index].iconData,
                                color: Colors.grey,
                                size: size.width*.1,
                              ),
                            ),
                          ]),
                          title: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(CommunityList[index].title,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: size.width*.048)),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              children: [
                                Icon(CupertinoIcons.arrow_down_left,size: size.width*.05,color: Color(0xff00AF80)),SizedBox(width: size.width*.02,),Text(CommunityList[index].Subtitle,
                                    style: TextStyle(color: Colors.white, fontSize: size.width*.038)),
                              ],
                            )
                          ),
                          trailing: Icon(Icons.videocam_rounded,size: size.width*.08,color: Color(0xff00AF80) ,),

                        ),
                      ],
                    ) ,
                  );
                },
              ),
            ],
          ),
        ));
  }
}
