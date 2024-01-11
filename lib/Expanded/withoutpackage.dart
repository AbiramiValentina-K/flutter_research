import 'package:flutter/material.dart';

class History {
  final String date;
  final String description;

  History({
    required this.date,
    required this.description,
  });
}

class MedicalIncident {
  final String incident;
  final int playerID;
  final int coachID;
  final List<History> history;

  MedicalIncident({
    required this.incident,
    required this.coachID,
    required this.playerID,
    required this.history,
  });
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<MedicalIncident> medicalIncidents = [
    MedicalIncident(
      incident: "Injury 1",
      coachID: 1,
      playerID: 101,
      history: [
        History(date: "2023-09-01", description: "For example, when installed from GitHub (as opposed to from a prepackaged archive), the Flutter tool will download the Dart SDK from Google servers immediately when first run,"),
        History(date: "2023-09-02", description: "Underwent X-ray examination."),
      ],
    ),
    MedicalIncident(
      incident: "Injury 1",
      coachID: 1,
      playerID: 101,
      history: [
        History(date: "2023-09-01", description: "Diagnosed with a sprained ankle."),
        History(date: "2023-09-02", description: "Underwent X-ray examination."),
      ],
    ),
    MedicalIncident(
      incident: "Injury 1",
      coachID: 1,
      playerID: 101,
      history: [
        History(date: "2023-09-01", description: "Diagnosed with a sprained ankle.l"),
        History(date: "2023-09-02", description: "Underwent X-ray examination."),
      ],
    ),
    MedicalIncident(
      incident: "Injury 1",
      coachID: 1,
      playerID: 101,
      history: [
        History(date: "2023-09-01", description: "Diagnosed with a sprained ankle."),
        History(date: "2023-09-02", description: "Underwent X-ray examination."),
      ],
    ),
    MedicalIncident(
      incident: "Injury 1",
      coachID: 1,
      playerID: 101,
      history: [
        History(date: "2023-09-01", description: "Diagnosed with a sprained ankle."),
        History(date: "2023-09-02", description: "Underwent X-ray examination."),
      ],
    ),
    // Add more medical incidents here
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        
        appBar: AppBar(
          title: Text('Medical Incidents'),
        ),
        body: ListView.builder(
          itemCount: medicalIncidents.length,
          itemBuilder: (context, index) {
            return MedicalIncidentCard(medicalIncident: medicalIncidents[index]);
          },
        ),
      ),
    );
  }
}

class MedicalIncidentCard extends StatefulWidget {
  final MedicalIncident medicalIncident;

  MedicalIncidentCard({required this.medicalIncident});

  @override
  _MedicalIncidentCardState createState() => _MedicalIncidentCardState();
}

class _MedicalIncidentCardState extends State<MedicalIncidentCard> {
  bool isExpanded = false;
  String newDescription = "";

  @override
  Widget build(BuildContext context) {
    final latestHistory = widget.medicalIncident.history.isNotEmpty
        ? widget.medicalIncident.history.last
        : null;

    return Padding(
      padding: const EdgeInsets.all(8.0), // Adjust the margin as needed
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: Text(widget.medicalIncident.incident),
              subtitle: Text("Player ID: ${widget.medicalIncident.playerID} | Coach ID: ${widget.medicalIncident.coachID}"),
              trailing: IconButton(
                icon: Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
                onPressed: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
              ),
            ),
            if (latestHistory != null)
              ListTile(
                title: Text('Latest History'),
                subtitle: Text(latestHistory.date),
              ),
            if (isExpanded)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (History history in widget.medicalIncident.history)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Adjust the padding as needed
                      child: ListTile(
                        title: Text(history.date),
                        subtitle: Text(history.description),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: (text) {
                        setState(() {
                          newDescription = text;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter new description',
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {
                        if (newDescription.isNotEmpty) {
                          setState(() {
                            widget.medicalIncident.history.add(
                              History(date: DateTime.now().toString(), description: newDescription),
                            );
                            newDescription = "";
                          });
                        }
                      },
                      child: Text('Send'),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
