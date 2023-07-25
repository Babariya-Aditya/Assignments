import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: DatePick(),
    );
  }


}

class DatePick extends StatefulWidget {
  const DatePick({Key? key}) : super(key: key);

  @override
  State<DatePick> createState() => _DatePickState();
}

class _DatePickState extends State<DatePick> {
  var _dobController = TextEditingController();
  var dob = '';

  @override
  Widget build(BuildContext context) {
    void Datepicker(BuildContext context) async {
      var date = await showDatePicker(
          fieldHintText: "dd/mm/yy",
          confirmText: "Done",
          errorFormatText: "Hell",
          errorInvalidText: "HEll aa",
          helpText: "Select DOB",
          fieldLabelText: "hell bro",
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2025));
      if (date != null) {
        dob = "${date.day}/${date.month}/${date.year}";
        _dobController.text = dob;
      }
      else {
        Text("please enter the dob");
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: TextField(
            controller: _dobController,
            onTap: () {
              Datepicker(context);
              FocusScope.of(context).requestFocus(FocusNode());
            },
            decoration: InputDecoration(icon: Icon(Icons.calendar_month,),border: OutlineInputBorder(),
                labelText: "Date of birth",
                ),

          ),
        ),
      ),
    );
  }

}
