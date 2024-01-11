import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class History {
  final String date;
  final String description;

  History({
    required this.date,
    required this.description,
  });
}

class MedicalIncident {
  final int headerID;
  final String incident;
  final int playerID;
  final int coachID;
  final List<History> history;

  MedicalIncident({
    required this.headerID,
    required this.incident,
    required this.coachID,
    required this.playerID,
    required this.history,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true,
      brightness: Brightness.dark),
      home: Directionality(
        textDirection: TextDirection.ltr,
        child: MedicalIncidentScreen(),
      ),
    );
  }
}

class MedicalIncidentScreen extends StatefulWidget {
  @override
  _MedicalIncidentScreenState createState() => _MedicalIncidentScreenState();
}

class _MedicalIncidentScreenState extends State<MedicalIncidentScreen> {
  final List<History> selectedHistory = [];

  void _showIncidentBottomSheet(BuildContext context) {
    // Code for showing the incident bottom sheet goes here...
  }

  void _showHistoryBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          children: [
            ListTile(
              title: Text('Select History'),
            ),
            Expanded(
              child: ListView(
                children: selectedIncident.history.map((historyItem) {
                  return CheckboxListTile(
                    title: Text(historyItem.description),
                    value: selectedHistory.contains(historyItem),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value != null) {
                          if (value) {
                            selectedHistory.add(historyItem);
                          } else {
                            selectedHistory.remove(historyItem);
                          }
                        }
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Done'),
            ),
          ],
        );
      },
    );
  }

  MedicalIncident selectedIncident = MedicalIncident(
    headerID: 1,
    incident: 'Incident 1',
    coachID: 101,
    playerID: 201,
    history: [
      History(date: '2023-01-01', description: 'History 1A'),
      History(date: '2023-01-02', description: 'History 1B'),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medical Incidents'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                _showIncidentBottomSheet(context);
              },
              child: Text('Select Incident'),
            ),
            SizedBox(height: 16.0),
            Text('Selected Incident: ${selectedIncident.incident}'),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _showHistoryBottomSheet(context);
              },
              child: Text('Select History'),
            ),
            SizedBox(height: 16.0),
            Text('Selected History:'),
            for (History history in selectedHistory)
              Text(history.description),
          ],
        ),
      ),
    );
  }
}
