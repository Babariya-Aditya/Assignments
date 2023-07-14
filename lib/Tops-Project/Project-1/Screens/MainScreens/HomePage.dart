import 'package:flutter/material.dart';

import '../Login-Page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var Pagelist=[];
  var selectIndex=0;
  @override
  void initState() {

    Pagelist.add(Center(child: Text("Home",style: TextStyle(fontSize: 30),)));
    Pagelist.add(Center(child: Text("Profile",style: TextStyle(fontSize: 30),)));
    Pagelist.add(Center(child: Text("My cart",style: TextStyle(fontSize: 30),)));
    Pagelist.add(Center(child: Text("My order",style: TextStyle(fontSize: 30),)));
   // Pagelist.add(Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),)));



    // TODO: implement initState
    super.initState();
  }
  ListTile getListTile({IconData? iconData, String title = '', String? s, int? index}) {
    return ListTile(
      selectedColor: Colors.white,
      selectedTileColor: Colors.orange,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),

          onTap: () {
            if(index!=null)
              {
                menuClicked(index!);
                Navigator.pop(context);
              }
            else{
              Navigator.pop(context);
            }

          },
      selected: selectIndex==index,
      leading: s == null
          ? Icon(
              iconData,
              size: 30,
            )
          : Text(s,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
      title: Text(title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Color(0xfff5f5f5),
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/profile (3).png'),
                        radius: 40,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.width * .02,
                  ),
                  Row(
                    children: [
                      Text(
                        "Aditya Babariya",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "adityababariya43@gamil.com",
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              decoration: BoxDecoration(color: Color(0xffF2E7FE)),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: ExpansionTile(
                  title: Text("Manage Product", style: TextStyle(fontSize:20 )),
                  leading:
                      Icon(Icons.local_hospital_rounded,size: 30, color: Colors.purple),
                  children: [
                    SizedBox(
                      height: size.width * 0.06,
                    ),
                    getListTile(s: "Add Product"),
                    getListTile(s: "Update Product"),
                    getListTile(s: "Remove Product"),
                  ],
                )),
            Divider(
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 13),
              child: Column(
                children: [
                  getListTile(iconData: Icons.home, title: "Home",index: 0),

                  getListTile(iconData: Icons.person, title: "Profile",index: 1),
                  getListTile(iconData: Icons.shopping_cart, title: "My Cart",index: 2),
                  getListTile(iconData: Icons.today_sharp, title: "My Order",index: 3),
                ],
              ),
            ),
            Divider(
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: getListTile(
                  iconData: Icons.exit_to_app_outlined, title: "Logout"),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        actions: [
          GestureDetector(
              child: Icon(
            Icons.search,
            size: 28,
          )),
          SizedBox(
            width: size.width * .06,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
                child: Icon(
              Icons.shopping_cart,
              size: 28,
            )),
          )
        ],
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text('Home'),
      ),
      body: Pagelist[selectIndex]
    );
  }

  void menuClicked(int i) {
    setState(() {
      selectIndex=i;
    });
  }
}
