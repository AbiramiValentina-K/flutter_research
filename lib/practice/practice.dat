import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Dialog Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return CustomDialog(); // Create a custom dialog
              },
            );
          },
          child: Icon(Icons.add), // Floating icon
        ),
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButton<String>(
              items: ["Option 1", "Option 2", "Option 3"].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                // Handle dropdown selection
              },
              hint: Text("Select an option"),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Show date picker
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
              },
              child: Text("Pick a Date"),
            ),
            SizedBox(height: 16.0),
            DropdownButton<String>(
              items: ["Option A", "Option B", "Option C"].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                // Handle dropdown selection
              },
              hint: Text("Select another option"),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter Text",
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle submit button tap
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
