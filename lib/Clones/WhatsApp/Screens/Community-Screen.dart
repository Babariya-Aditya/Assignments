import 'package:assignment_1/Clones/WhatsApp/Modals/Community.dart';
import 'package:flutter/material.dart';

import '../Modals/User.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  var CommunityList = <Community>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CommunityList.add(Community(
        title: "Coding Club",
        Subtitle: '',
        Date: "05/06/23",
        iconData: Icons.pages));
    CommunityList.add(Community(
        title: "BasketBall Club",
        Subtitle: 'Be ready for Hustle',
        Date: "10/06/23",
        iconData: Icons.sports_basketball));
    CommunityList.add(Community(
        title: "Cricket Club",
        Subtitle: 'India India India',
        Date: "yesterday",
        iconData: Icons.safety_divider));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xff131C2C),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("New Community",
                        style: TextStyle(fontSize: size.width*.052, color: Colors.white)),
                  ),
                  leading: Stack(clipBehavior: Clip.none, children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10)),
                      height: size.width * .12,
                      width: size.width * .12,
                      child: Icon(
                        Icons.groups,
                        color: Colors.black,
                        size: size.width*.1,
                      ),
                    ),
                    Positioned(
                        right: -size.width*.03,
                        top: size.width * .078,
                        child: CircleAvatar(
                          backgroundColor: Color(0xff00AF80),
                          radius: size.width*.028,
                          child: Icon(Icons.add,size: size.width*.05),
                        ))
                  ]),
                ),
              ),
              SizedBox(
                width: size.width * .07,
              ),

              Divider(

                height: 5,
                thickness: 10,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: CommunityList.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      children: [

                    ListTile(
                      tileColor: Color(0xff131C2C),
                      leading:  Stack(clipBehavior: Clip.none, children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)),
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
                                fontSize: size.width*.05)),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(CommunityList[index].Subtitle,
                            style: TextStyle(color: Colors.white, fontSize: size.width*.038)),
                      ),
                      trailing: Container(
                        width: size.width * .2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(CommunityList[index].Date,
                                style: TextStyle(color: Colors.grey)),
                            SizedBox(
                              width: size.width * .03,
                            ),
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.volume_off_sharp, color: Colors.grey,size: size.width*.06),
                                SizedBox(
                                  width: size.width * .02,
                                ),

                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                        Divider(thickness: 0.3,
                            color: Colors.grey),
                      ],
                    ) ,
                  );
                },
              ),
              SizedBox(

                height: size.width*.03,
              ),
              ListTile(
                leading: Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey,size: size.width*.05),
                title: Padding(
                  padding: const EdgeInsets.only(left: 35.0),
                  child: Text("View all",style: TextStyle(fontSize: size.width*.05,color: Colors.grey)),
                ),
              ),
              
            ],
          ),
        ));
  }
}
