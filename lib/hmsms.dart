import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DurationInputScreen(),
    );
  }
}

class DurationInputScreen extends StatefulWidget {
  @override
  _DurationInputScreenState createState() => _DurationInputScreenState();
}

class _DurationInputScreenState extends State<DurationInputScreen> {
  int hours = 0;
  int minutes = 0;
  int seconds = 0;
  int milliseconds = 0;
  double totalSeconds = 0.0;

  TextEditingController hoursController = TextEditingController();
  TextEditingController minutesController = TextEditingController();
  TextEditingController secondsController = TextEditingController();
  TextEditingController millisecondsController = TextEditingController();
  TextEditingController totalSecondsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Duration Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildTextField('Hours', hoursController, (value) {
                  setState(() {
                    hours = int.tryParse(value) ?? 0;
                  });
                  updateTotalSeconds();
                }),
                buildTextField('Minutes', minutesController, (value) {
                  setState(() {
                    minutes = int.tryParse(value) ?? 0;
                  });
                  updateTotalSeconds();
                }),
                buildTextField('Seconds', secondsController, (value) {
                  setState(() {
                    seconds = int.tryParse(value) ?? 0;
                  });
                  updateTotalSeconds();
                }),
                buildTextField('Milliseconds', millisecondsController, (value) {
                  setState(() {
                    milliseconds = int.tryParse(value) ?? 0;
                  });
                  updateTotalSeconds();
                }),
              ],
            ),
            SizedBox(height: 16),
            buildTextField('Total Seconds.Milliseconds', totalSecondsController, (value) {
              setState(() {
                totalSeconds = double.tryParse(value) ?? 0.0;
              });
              updateDurationParts();
            }),
            SizedBox(height: 16),
            Text(
              'Formatted Duration: ${formatDuration()}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller, Function(String) onChanged) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          onChanged: onChanged,
          decoration: InputDecoration(labelText: label),
        ),
      ),
    );
  }

  void updateTotalSeconds() {
    totalSeconds = hours * 3600 + minutes * 60 + seconds + milliseconds / 1000.0;
    totalSecondsController.text = totalSeconds.toString();
    updateDurationParts();
  }

  void updateDurationParts() {
    hours = (totalSeconds / 3600).floor();
    minutes = ((totalSeconds % 3600) / 60).floor();
    seconds = (totalSeconds % 60).floor();
    milliseconds = ((totalSeconds * 1000) % 1000).floor();
    setState(() {});
  }

  String formatDuration() {
    return '$hours:${_twoDigits(minutes)}:${_twoDigits(seconds)}.${_threeDigits(milliseconds)}';
  }

  String _twoDigits(int n) => n.toString().padLeft(2, '0');
  String _threeDigits(int n) => n.toString().padLeft(3, '0');
}
