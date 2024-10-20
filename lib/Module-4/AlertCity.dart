import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: CitySelectionDialogDemo(),
  ));
}

class CitySelectionDialogDemo extends StatefulWidget {
  @override
  _CitySelectionDialogDemoState createState() =>
      _CitySelectionDialogDemoState();
}

class _CitySelectionDialogDemoState extends State<CitySelectionDialogDemo> {
  String? selectedCity; // Holds the selected city
  List<String> cities = ['New York', 'Los Angeles', 'Chicago', 'Houston', 'Phoenix'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('City Selection')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the selected city in a Text widget
            Text(
              selectedCity == null ? 'No city selected' : 'Selected City: $selectedCity',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showCitySelectionDialog(context);
              },
              child: Text('Select City'),
            ),
          ],
        ),
      ),
    );
  }

  // Function to display the alert dialog with the list of cities
  void showCitySelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String? tempSelectedCity = selectedCity; // Temporary selection

        return AlertDialog(
          title: Text('Select a City'),
          content: StatefulBuilder(
            builder: (context, setState) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: cities.map((city) {
                    return RadioListTile<String>(
                      title: Text(city),
                      value: city,
                      groupValue: tempSelectedCity,
                      onChanged: (value) {
                        setState(() {
                          tempSelectedCity = value;
                        });
                      },
                    );
                  }).toList(),
                ),
              );
            },
          ),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                setState(() {
                  selectedCity = tempSelectedCity; // Update the selected city
                });
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }
}
