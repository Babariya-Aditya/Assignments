import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: DatePickerDemo(),
  ));
}

class DatePickerDemo extends StatefulWidget {
  @override
  _DatePickerDemoState createState() => _DatePickerDemoState();
}

class _DatePickerDemoState extends State<DatePickerDemo> {
  DateTime? selectedDate; // Holds the selected date

  // Function to show the date picker dialog
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Default date in the picker
      firstDate: DateTime(2000),   // Earliest date to pick
      lastDate: DateTime(2100),    // Latest date to pick
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate; // Update the selected date
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Date Picker Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the selected date
            Text(
              selectedDate == null
                  ? 'No date selected'
                  : 'Selected Date: ${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _selectDate(context); // Show the date picker
              },
              child: Text('Select Date'),
            ),
          ],
        ),
      ),
    );
  }
}
