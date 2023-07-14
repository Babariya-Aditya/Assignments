import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home:P9()
    );
  }
}
class P9 extends StatefulWidget {
  const P9({Key? key}) : super(key: key);

  @override
  State<P9> createState() => _P9State();
}

class _P9State extends State<P9> {
  String? Colorr;
  Color color=Colors.amber;
  void getValues(String? value){
    setState(() {

      Colorr=value;
      switch(Colorr){
        case "1":
          color=Colors.deepOrange;
          break;
        case "2":
          color=Colors.cyanAccent;
          break;
        case "3":
          color=Colors.greenAccent;
          break;
        case "4":
          color=Colors.deepPurple;
          break;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Center(
        child: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Choose any one color",style: TextStyle(fontSize: 20),)
                ],
              ),
              RadioListTile(title: Text("Orange"),value: '1', groupValue: Colorr, onChanged: (value) {
                getValues(value);
              },),
              RadioListTile(title: Text("Cyan"),value: '2', groupValue: Colorr, onChanged: (value) {
                getValues(value);


              },),
              RadioListTile(title: Text("Green"),value: '3', groupValue: Colorr, onChanged: (value) {
                getValues(value);


              },),
              RadioListTile(title: Text("Purple"),value: '4', groupValue: Colorr, onChanged: (value) {
                getValues(value);
              },),
            ],
          )
        ),
      ),
    );
  }
}
