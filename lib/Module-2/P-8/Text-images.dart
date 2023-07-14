import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App', home: P8());
  }
}

class P8 extends StatelessWidget {
  const P8({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Center(
          child: Container(
            alignment: Alignment.center,
            child: Stack(
        children: [
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 200,
                        width: 195,
                        child: Image.network(
                            'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
                            fit: BoxFit.fill),
                      ),
                      Container(
                        height: 200,
                        width: 195,
                        child: Image.network(
                            'https://cdn.pixabay.com/photo/2015/10/30/20/13/sunrise-1014712_640.jpg',
                            fit: BoxFit.fill),
                      )
                    ],
                  ),

                  Row(
                    children: [
                      Container(
                        height: 200,
                        width: 195,
                        child: Image.network(
                            'https://cdn.pixabay.com/photo/2017/03/02/16/54/iceland-2111811_640.jpg',
                            fit: BoxFit.fill),
                      ),
                      Container(
                        height: 200,
                        width: 195,
                        child: Image.network(
                            'https://cdn.pixabay.com/photo/2020/03/03/20/31/boat-4899802_960_720.jpg',
                            fit: BoxFit.fill),
                      )
                    ],
                  )
                ],
              ),
            ),
            Positioned(top: 180,left:135,child: Text("LandScapes",style: TextStyle(fontSize: 32,color: Colors.white,fontWeight: FontWeight.bold),))
        ],
      ),
          )),
    );
  }
}
