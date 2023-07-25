// Toast Tpopic Not Done in class
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CitySelectionScreen(),
    );
  }
}

class CitySelectionScreen extends StatefulWidget {
  @override
  _CitySelectionScreenState createState() => _CitySelectionScreenState();
}

class _CitySelectionScreenState extends State<CitySelectionScreen> {
  String selectedCity = ''; // To store the selected city

  // List of cities
  List<String> cities = [
    'New York',
    'Los Angeles',
    'Chicago',
    'Houston',
    'San Francisco',
    'Miami',
    'Seattle',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('City Selection')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _showCitySelectionDialog();
              },
              child: Text('Select City'),
            ),
            SizedBox(height: 20),
            Text(
              'Selected City: $selectedCity',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  void _showCitySelectionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select a City'),
          content: Container(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: cities.length,
              itemBuilder: (context, index) {
                return RadioListTile(
                  title: Text(cities[index]),
                  value: cities[index],
                  groupValue: selectedCity,
                  onChanged: (value) {
                    setState(() {
                      selectedCity = value!;
                    });
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
