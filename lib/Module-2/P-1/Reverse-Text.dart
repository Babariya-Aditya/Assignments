import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: ReverseText()
    );
  }
}
class ReverseText extends StatefulWidget {
  const ReverseText({Key? key}) : super(key: key);

  @override
  State<ReverseText> createState() => _ReverseTextState();
}

class _ReverseTextState extends State<ReverseText> {
  var TextController=TextEditingController();

   var Reverse;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  setState(() {
                    TextController.text=value.split('').reversed.join('');

                  });
                },
                decoration: InputDecoration(labelText: "Enter Text"),
              ),
              TextField(
                controller: TextEditingController(text: TextController.text),
                decoration: InputDecoration(labelText: "Enter Text"),
              ),


            ],
          )
        ),
      ),
    );
  }
}
