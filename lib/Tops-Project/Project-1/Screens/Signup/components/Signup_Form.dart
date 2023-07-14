import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SigupForm extends StatefulWidget {
  @override
  State<SigupForm> createState() => _SigupFormState();
}

class _SigupFormState extends State<SigupForm> {
  String gender = "Male";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          buildNameformField(),
          SizedBox(
            height: 16,
          ),
          buildEmailFormField(),
          SizedBox(
            height: 16,
          ),
          buildContactFormField(),
          SizedBox(
            height: 16,
          ),
          buildChooseGender(),
          SizedBox(
            height: 16,
          ),
          buildSelecttype(),
          SizedBox(
            height: 16,
          ),
          buildBirthdate(),
          SizedBox(
            height: 16,
          ),
          buildAddress(),
          SizedBox(
            height: 16,
          ),
          buildPassword(),
          SizedBox(
            height: 16,
          ),
          buildConfirmPassword(),
          SizedBox(
            height: 26,
          ),
          buildSignUpButtonWidget()
        ],
      ),
    );
  }

  buildNameformField() {
    return Row(
      children: [
        Expanded(
            child: TextFormField(
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: "First Name",
                labelText: "First Name",
              ),
            )),
        SizedBox(
          width: 16,
        ),
        Expanded(
            child: TextFormField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: "Last Name",
                labelText: "Last Name",
              ),
            )),
      ],
    );
  }

  buildEmailFormField() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "Email Adress",
        labelText: "Email",
      ),
    );
  }

  buildContactFormField() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: "Contact",
        labelText: "Contact",
      ),
    );
  }

  buildChooseGender() {
    return Row(
      children: [
        Text("Gender"),
        Expanded(
            child: RadioListTile(
              value: "Male",
              groupValue: gender,
              onChanged: (value) {},
              title: Text("Male"),
            )),
        Expanded(
            child: RadioListTile(
              value: "Female",
              groupValue: gender,
              onChanged: (value) {},
              title: Text("Female"),
            )),
        Expanded(
            child: RadioListTile(
              value: "other",
              groupValue: gender,
              onChanged: (value) {},
              title: Text("other"),
            )),
      ],
    );
  }

  buildSelecttype() {
    return DropdownButtonFormField(
      decoration:
      InputDecoration(hintText: "Select User", labelText: "Select User"),
      items: [
        DropdownMenuItem(value: "User", child: Text("User")),
        DropdownMenuItem(value: "Admin", child: Text("Admin"))
      ],
      onChanged: (value) {},
    );
  }

  buildBirthdate() {
    return TextFormField(
      onTap: () {
        setState(() {
          showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2002),
              lastDate: DateTime(2025));
          FocusScope.of(context).requestFocus(FocusNode());
        });
      },
      decoration: InputDecoration(
          labelText: "Select BirthDate",
          suffixIcon: Icon(Icons.calendar_month)),
    );
  }

  buildAddress() {
    return TextFormField(
      maxLines: 3,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        labelText: "Address",
        hintText: "Address",


      ),
    );
  }

  buildPassword() {
    return TextFormField(
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: 'Enter password',
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }

  buildConfirmPassword() {
    return TextFormField(
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Confirm password",
        hintText: 'Enter password',
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }

  buildSignUpButtonWidget() {
    return MaterialButton(
      color: Colors.indigoAccent,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      onPressed: () {},
      child: Padding(
        
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Sign Up',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
