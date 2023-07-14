import 'package:assignment_1/Tops-Project/Project-1/Screens/Forgot-password.dart';
import 'package:assignment_1/Tops-Project/Project-1/Screens/Profile-Page.dart';
import 'package:assignment_1/Tops-Project/Project-1/Screens/Register-Acc.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      body: Center(
        child: SafeArea(
          child: ListView(
            children: [
              Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Container(


                        height: size.width * .75,
                        width: size.width * .75,
                        child: Image.asset('assets/images/login (2).png'),
                      ),
                      const Text(
                        "Welcome Back",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: size.width * .05),
                      const Text(
                        "Login with your email and password",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: size.width*.09),

                      SizedBox(height: size.width * .05),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            TextFormField(textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50
                                      )),
                                  labelText: "Email",
                                  labelStyle: TextStyle(fontSize: 20),
                                  suffixIcon: Icon(Icons.email,size: 30,color: Colors.grey,)),
                            ),

                            SizedBox(height: size.width * .05),
                            TextFormField(obscureText: true,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50
                                      )),
                                  labelText: "Password",

                                  labelStyle: TextStyle(fontSize: 20),
                                  suffixIcon: Icon(Icons.lock_open_outlined,size: 30,color: Colors.grey,)),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword(),)),
                            child: Text(
                              "Forgot Password",
                              style: TextStyle(fontSize: 16, decoration: TextDecoration.underline,decorationThickness: 1.5),
                            ),
                          ),



                        ],
                      ),
                      SizedBox(height: size.width * .05),
                      Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                        height: size.width*.15,
                        width: size.width*.9,
                        child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurpleAccent.shade400,),onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePagee(),));

                        }, child: Text("Log In",style: TextStyle(fontSize: 20),)),
                      ),
                      SizedBox(height: size.width * .1),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(fontSize: 16, ),
                          ),
                          SizedBox(width: size.width * .04),
                          GestureDetector(onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage(),));
                          },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(fontSize: 17,color: Colors.deepPurpleAccent.shade400,fontWeight: FontWeight.bold ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
