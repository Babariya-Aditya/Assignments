import 'package:assignment_1/Module-2/P-2/Modals/values.dart';
import 'package:assignment_1/Module-2/P-3/Second.dart';
import 'package:flutter/material.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App', home: ArithmeticOperations());
  }
}

class ArithmeticOperations extends StatefulWidget {
  const ArithmeticOperations({Key? key}) : super(key: key);

  @override
  State<ArithmeticOperations> createState() => _ArithmeticOperationsState();
}

class _ArithmeticOperationsState extends State<ArithmeticOperations> {
  var First = TextEditingController();
  var Second = TextEditingController();
  int result =0;
  String? Operation;
  void getValues(String? value){
   setState(() {
     int a = int.tryParse(First.text) ?? 0;
     int b = int.tryParse(Second.text) ?? 0;
     Operation=value;
     switch(Operation){
       case "Add":
         result=a+b;
         break;
       case "Subtract":
         result=a-b;
         break;
       case "Multiply":
         result=a*b;
         break;
       case "Divide":
         result=a~/b;
         break;
     }
   });
  }


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
                  height: 20,
                ),
                RadioListTile(value: 'Add', groupValue: Operation, onChanged: (value) {
                  getValues(value);
                },),
                RadioListTile(value: 'Subtract', groupValue: Operation, onChanged: (value) {
                  getValues(value);


                },),
                RadioListTile(value: 'Multiply', groupValue: Operation, onChanged: (value) {
                  getValues(value);


                },),
                RadioListTile(value: 'Divide', groupValue: Operation, onChanged: (value) {
                  getValues(value);
                },),
                Text("$result"),
                ElevatedButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPAge(result),));

                }, child: Text("Next"))


              ],
            )),
      ),
    );
  }
}
