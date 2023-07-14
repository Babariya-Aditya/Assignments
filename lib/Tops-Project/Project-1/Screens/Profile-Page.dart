import 'package:assignment_1/Tops-Project/Project-1/Modal/items.dart';
import 'package:assignment_1/Tops-Project/Project-1/Screens/Register-Acc.dart';
import 'package:flutter/material.dart';

class ProfilePagee extends StatelessWidget {
  TextFormField getFormField(
      {String? label,
      String? Hint,
      IconData? iconData,
      double? size,
      double? edge,
      bool? isbool}) {
    return TextFormField(
      obscureText: isbool!,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 5),
              borderRadius: BorderRadius.circular(edge!)),
          labelText: label,
          labelStyle: TextStyle(fontSize: size),
          suffixIcon: Icon(
            iconData,
            size: 30,
            color: Colors.grey,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            child: Column(children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new_sharp,
                        size: 25,
                      )),
                  SizedBox(
                    width: size.width * .15,
                  ),
                  Text(
                    "Update Profile",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  )
                ],
              ),
              SizedBox(
                height: size.width * .08,
              ),
              Image.asset('assets/images/profile (3).png'),
              SizedBox(
                height: size.width * .04,
              ),
              Text(
                "Upadate your profile from here",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                width: size.width * .09,
              ),
              SizedBox(
                height: size.width * .1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: size.width * .45,
                      child: getFormField(
                          iconData: Icons.person,
                          isbool: false,
                          edge: 50,
                          label: "First Name",
                          size: 22)),
                  SizedBox(
                      width: size.width * .45,
                      child: getFormField(
                          isbool: false,
                          iconData: Icons.person,
                          edge: 50,
                          label: "Last Name",
                          size: 22)),
                ],
              ),
              SizedBox(
                height: size.width * .07,
              ),
              getFormField(
                  isbool: false,
                  iconData: Icons.email,
                  edge: 50,
                  label: "Email",
                  size: 22),
              SizedBox(
                height: size.width * .07,
              ),
              getFormField(
                  isbool: false,
                  iconData: Icons.phone,
                  edge: 50,
                  label: "Contact",
                  size: 22),
              SizedBox(
                height: size.width * .07,
              ),
              getFormField(
                  isbool: true,
                  iconData: Icons.lock_outline,
                  edge: 50,
                  label: "Password",
                  size: 22),
              SizedBox(
                height: size.width * .07,
              ),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                height: size.width * .15,
                width: size.width * .9,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurpleAccent.shade400),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage(),));
                    },
                    child: Text(
                      "Log In",
                      style: TextStyle(fontSize: 20),
                    )),
              ),
            ]),
          ),
        ],
      )),
    );
  }
}
