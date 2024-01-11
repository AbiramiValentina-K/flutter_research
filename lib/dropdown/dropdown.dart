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

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Sample data for incidents and history
  final List<MedicalIncident> incidents = [
    MedicalIncident(
      headerID: 1,
      incident: 'Incident 1',
      coachID: 101,
      playerID: 201,
      history: [
        History(date: '2023-01-01', description: 'History 1A'),
        History(date: '2023-01-02', description: 'History 1B'),
      ],
    ),
    MedicalIncident(
      headerID: 2,
      incident: 'Incident 2',
      coachID: 102,
      playerID: 202,
      history: [
        History(date: '2023-02-01', description: 'History 2A'),
        History(date: '2023-02-02', description: 'History 2B'),
      ],
    ),
  ];

  String selectedIncident = '';
  List<History> selectedHistory = [];

  @override
  void initState() {
    super.initState();
    // Set the initial value for the second dropdown to match the first dropdown
    if (incidents.isNotEmpty) {
      selectedIncident = incidents[0].incident;
      selectedHistory = incidents[0].history;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Medical Incidents'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownButtonFormField<String>(
                value: selectedIncident,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedIncident = newValue!;
                    selectedHistory = incidents
                        .firstWhere((incident) => incident.incident == newValue)
                        .history;
                  });
                },
                items: incidents.map((MedicalIncident incident) {
                  return DropdownMenuItem<String>(
                    value: incident.incident,
                    child: Text(incident.incident),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Select Incident',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                value: selectedHistory.isNotEmpty ? selectedHistory[0].description : '',
                onChanged: (String? newValue) {},
                items: selectedHistory.map((History history) {
                  return DropdownMenuItem<String>(
                    value: history.description,
                    child: Text(history.description),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Select History',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
