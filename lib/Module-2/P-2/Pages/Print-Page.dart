import 'package:assignment_1/Module-2/P-2/Modals/values.dart';
import 'package:flutter/material.dart';

class PrintPage extends StatelessWidget {
  Values values;

  PrintPage(this.values);

  List PrintNumber(int a, int b, BuildContext context) {
    List Number = [];
    for (int i = a + 1; i < b; i++) {
      Number.add(i);
    }
    return Number;
  }
  @override
  Widget build(BuildContext context) {
    List Number = PrintNumber(values.a, values.b, context);

    //var Lists=List.generate(values.b-values.a, (index) => index+values.a);

    return Scaffold(
        appBar: AppBar(
          title: Text("Hello"),
        ),
        body: ListView(
          children: [
            Container(
              child: Column(
                children: [
                  for (int i = values.a + 1; i < values.b; i++) Text("$i")
                ],
              ),
            ),
          ],
        ) //ListView.builder(itemCount: Number.length,itemBuilder: (context, index) => Text("${Number[index]}"),)
        );
  }
}
