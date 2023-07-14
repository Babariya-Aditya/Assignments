import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: P7()
    );
  }
}
class P7 extends StatefulWidget {
  const P7({Key? key}) : super(key: key);

  @override
  State<P7> createState() => _P7State();
}

class _P7State extends State<P7> {
  var isbool=false;
  String s='';
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Center(
        child:Card(
          elevation: 15,
          child: Container(
            child: CheckboxListTile(title: Text("${s}",style: TextStyle(fontWeight: FontWeight.bold,fontSize:22 )),
              value: isbool,
              onChanged: (value) {
                print(value);
                setState(() {
                  isbool = value!;
                  if(value==false){
                    s='';
                  }
                  else{
                    s="Done";
                  }
                },);
              },

            ),
          ),
        )
      ),
    );
  }
}
