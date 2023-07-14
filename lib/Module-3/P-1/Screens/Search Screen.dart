import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Container(
          color:Colors.white,
          width: double.infinity,
          height: 40,
          child: TextField(
            decoration: InputDecoration(suffixIcon: Icon(Icons.search),
                hintText: "Search",
               ),)),),

    );
  }
}
