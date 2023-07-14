import 'package:assignment_1/Tops-Project/Project-1/Screens/Login-Page.dart';
import 'package:assignment_1/Tops-Project/Project-1/Screens/onboarding/Components/Sliderview.dart';
import 'package:assignment_1/Tops-Project/Project-1/Screens/onboarding/Components/indicator.dart';
import 'package:flutter/material.dart';

import '../../../Modal/onboarding.dart';
import '../../Sign_in/Sigin_Screen.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Item> itemList = [];
  int currentindex = 0;
  final pagecontroller = PageController();


  @override
  void initState() {
    // TODO: implement initState

    itemList.add(Item(
        image: "assets/images/Splash.png",
        desc:
            "'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.'",
        title: "Select items"));
    itemList.add(Item(
        image: "assets/images/shopping.png",
        desc:
            "'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.'",
        title: "Purchase"));
    itemList.add(Item(
        image: "assets/images/7767900_3693393.jpg",
        desc:
            "'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.'",
        title: "Delivery"));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                for(int i=0;i<itemList.length;i++)
                  if(i==currentindex)
                    getindicator(true)
                else
                  getindicator(false)


              ],
            ),
            Row(
              children: [
                Container(
                  height: 40,
                  width: 100,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigoAccent),
                      onPressed: () {
                        if(currentindex!=itemList.length-1){
                          currentindex++;
                          pagecontroller.animateToPage(currentindex , duration: Duration(microseconds: 300), curve:Curves.easeOutQuad);
                        }
                        else{
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SiginForm(),));
                        }

                      },
                      child: currentindex!=itemList.length-1?Text("NEXT"):Text("FINISH")),
                )
              ],
            )
          ],
        ),
      ),
      body: PageView.builder(controller: pagecontroller,
        onPageChanged: (value) {
          setState(() {
            currentindex = value;
          });
        },
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          return Sliderview(itemList[index]);
        },
      ),
    );
  }
}
