import 'package:assignment_1/Tops-Project/Project-1/Modal/items.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
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

                    ],
                  ),
                  SizedBox(
                    height: size.width * .08,
                  ),
                  Text(
                    "Forgot Password",
                    style: TextStyle(fontSize: 26,fontWeight:FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.width * .04,
                  ),
                  Text(
                    "Please enter your email and we will send \n       you a link to return your accouint",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: size.width * .15,
                  ),


                  getFormField(isbool: false,
                      iconData: Icons.email,
                      edge: 50,
                      label: "Email",
                      size: 22),

                  SizedBox(
                    height: size.width * .15,
                  ),
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    height: size.width*.15,
                    width: size.width*.9,
                    child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurpleAccent.shade400),onPressed: () {

                    }, child: Text("Send verification email",style: TextStyle(fontSize: 20),)),
                  ),
                  SizedBox(
                    height: size.width * .15,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(fontSize: 16, ),
                      ),
                      SizedBox(width: size.width * .04),
                      Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 17,color: Colors.deepPurpleAccent.shade400,fontWeight: FontWeight.bold ),
                      ),
                    ],
                  )
                ]),
              ),
            ],
          )),
    );
  }
}
