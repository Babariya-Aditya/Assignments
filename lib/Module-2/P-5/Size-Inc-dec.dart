import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: P5()
    );
  }
}
class P5 extends StatefulWidget {


  @override
  State<P5> createState() => _P5State();
}

class _P5State extends State<P5> {
  double Size=18;
  void increment(){
      setState(() {
        Size++;
      });
  }
  void decrement(){
    setState(() {
      Size--;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Size'),
      ),
      body: Center(
        child: Container(
          child:Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Hello World',style: TextStyle(fontSize: Size,fontWeight: FontWeight.bold)),
              SizedBox(height: 50,),
             Row(mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 ElevatedButton(onPressed: () => increment(), child: Text("Increment")),
                 SizedBox(width: 50,),

                 ElevatedButton(onPressed: () => decrement(), child: Text("Decrement"))
               ],
             )
            ],
          )
        ),
      ),
    );
  }
}
