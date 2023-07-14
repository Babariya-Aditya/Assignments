
import 'package:assignment_1/Tops-Project/Project-1/Screens/Register-Acc.dart';
import 'package:flutter/material.dart';

class Sigin extends StatelessWidget {
  LoginButton() {
    return Container(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurpleAccent),
          onPressed: () {
          },
          child: Text(
            "Login ",
            style: TextStyle(fontSize: 22),
          )),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        EmailFormField(),
        SizedBox(
          height: 28,
        ),
        PasswordFormField(),
        SizedBox(
          height: 10,
        ),
        ForgotButton(),
        SizedBox(
          height: 28,
        ),
        LoginButton()
      ],
    ));

  }

  EmailFormField() {
    return TextFormField(
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.email, color: Colors.black),
        labelText: "Email",
        hintText: "Enter Email",
      ),
    );
  }

  PasswordFormField() {
    return TextFormField(
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.remove_red_eye, color: Colors.black),
        labelText: "Password",
        hintText: "Enter Password",
      ),
    );

  }

  ForgotButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
            onPressed: () {},
            child: Text(
              "Forgot Password?",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                decoration: TextDecoration.underline,
              ),
            ))
      ],
    );
  }
}
