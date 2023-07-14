import 'package:assignment_1/Module-2/P-2/Modals/values.dart';
import 'package:flutter/material.dart';

import 'Print-Page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App', home: PassString());
  }
}

class PassString extends StatefulWidget {
  const PassString({Key? key}) : super(key: key);

  @override
  State<PassString> createState() => _PassStringState();
}

class _PassStringState extends State<PassString> {
  var First = TextEditingController();
  var Second = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Center(
        child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                TextField(
                  controller: First,
                  decoration: InputDecoration(labelText: "Enter Text"),
                ),
                TextField(
                  controller: Second,
                  decoration: InputDecoration(labelText: "Enter Text"),
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                    onPressed: () {
                      int a = int.tryParse(First.text) ?? 0;
                      //String b=Second.text.toString().trim();
                      int b = int.tryParse(Second.text) ?? 0;
                      var values=Values(a: a, b: b);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PrintPage(values),
                          ));
                    },
                    child: Text("Next Page"))
              ],
            )),
      ),
    );
  }
}
