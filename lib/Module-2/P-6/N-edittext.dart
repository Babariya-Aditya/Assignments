import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: P6()
    );
  }
}
class P6 extends StatefulWidget {
  const P6({Key? key}) : super(key: key);

  @override
  State<P6> createState() => _P6State();
}

class _P6State extends State<P6> {

  var TextController=TextEditingController();
  int number=0;

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Center(
        child: ListView(children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(
                  controller: TextController,
                  decoration: InputDecoration(labelText: "Enter a Number"),

                ),
                ElevatedButton(onPressed: () {
                  setState(() {
                    int num=int.parse(TextController.text);
                    number=num;
                    print(number);
                  });


                }, child: Text("Generate")),
                ListView.builder(itemCount: number,physics: NeverScrollableScrollPhysics(),shrinkWrap: true,itemBuilder: (context, index) {
                  return TextField(
                    decoration: InputDecoration(labelText: "${index + 1}"),

                  );
                },)
              ],
            ),
          ),
        ],)
      ),
    );
  }
}
