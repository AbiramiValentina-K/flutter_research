import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Map<String, dynamic>> data = [
    {
        "practiceId": 15,
        "userId": 36,
        "subEventId": 5,
        "performance": 12.7,
        "session": "morning",
        "remarks": "string",
        "warmUpWorkoutHeaderId": 0,
        "academyId": 2,
        "coachId": 30,
        "createBy": 30,
        "createDate": "2024-01-01",
        "modifyDate": "2024-01-01"
    },
    {
        "practiceId": 14,
        "userId": 36,
        "subEventId": 6,
        "performance": 12.5,
        "session": "morning",
        "remarks": "string",
        "warmUpWorkoutHeaderId": 0,
        "academyId": 2,
        "coachId": 30,
        "createBy": 30,
        "createDate": "2023-12-31",
        "modifyDate": "2023-12-31"
    },
    {
        "practiceId": 8,
        "userId": 36,
        "subEventId": 5,
        "performance": 12.5,
        "session": "Morning",
        "remarks": null,
        "warmUpWorkoutHeaderId": null,
        "academyId": null,
        "coachId": 36,
        "createBy": 36,
        "createDate": "2023-12-28",
        "modifyDate": "2023-12-28"
    },
    {
        "practiceId": 14,
        "userId": 36,
        "subEventId": 6,
        "performance": 12.5,
        "session": "Evening",
        "remarks": "string",
        "warmUpWorkoutHeaderId": 0,
        "academyId": 2,
        "coachId": 30,
        "createBy": 30,
        "createDate": "2023-12-31",
        "modifyDate": "2023-12-31"
    },
    {
        "practiceId": 9,
        "userId": 36,
        "subEventId": 5,
        "performance": 12.4,
        "session": "Morning",
        "remarks": null,
        "warmUpWorkoutHeaderId": null,
        "academyId": null,
        "coachId": 36,
        "createBy": 36,
        "createDate": "2023-12-25",
        "modifyDate": "2023-12-28"
    },
    {
        "practiceId": 10,
        "userId": 36,
        "subEventId": 5,
        "performance": 12.56,
        "session": "Morning",
        "remarks": null,
        "warmUpWorkoutHeaderId": null,
        "academyId": null,
        "coachId": 36,
        "createBy": 36,
        "createDate": "2023-12-22",
        "modifyDate": "2023-12-28"
    },
    {
        "practiceId": 13,
        "userId": 36,
        "subEventId": 6,
        "performance": 25,
        "session": "Morning",
        "remarks": null,
        "warmUpWorkoutHeaderId": null,
        "academyId": null,
        "coachId": 36,
        "createBy": 36,
        "createDate": "2023-12-20",
        "modifyDate": "2023-12-28"
    }
];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CalendarWidget(data: data),
      ),
    );
  }
}
class CalendarWidget extends StatefulWidget {
  final List<Map<String, dynamic>> data;

  CalendarWidget({required this.data});

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  late List<Appointment> _appointments;
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();

    _selectedDate = DateTime.now();

    // Process the data to create a list of appointments
    _appointments = widget.data
        .map((item) {
          DateTime createDate = DateTime.parse(item['createDate']);
          Color eventColor = (item['session'] == 'Morning') ? Colors.yellow : Colors.orange;

          return Appointment(
            startTime: createDate,
            endTime: createDate.add(Duration(hours: 1)), // Adjust as needed
            subject: 'Event', // You can customize the subject
            color: eventColor, // Set color based on session
          );
        })
        .toList();
  }

  void _handleDateTap() {
    // Handle tap on an empty date
    // You can show a form or dialog to input the necessary data
    // After obtaining the data, add a new event to the calendar
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Your form or dialog UI here
        return AlertDialog(
          title: Text('Add Event'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                // Your form fields here to input data
                // For example, you can use TextFormField for each field
                TextFormField(
                  // Specify parameters for the user to input data
                ),
                // Add more form fields as needed
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Logic to add the new event based on the entered data
                // You can add the new event to _appointments list
                // and update the calendar
                // For simplicity, I'm adding a placeholder event
                setState(() {
                  _appointments.add(
                    Appointment(
                      startTime: _selectedDate,
                      endTime: _selectedDate.add(Duration(hours: 1)), // Adjust as needed
                      subject: 'New Event', // You can customize the subject
                      color: Colors.green, // Set color for new events
                    ),
                  );
                });

                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: SfCalendar(
        view: CalendarView.month,
        dataSource: AppointmentDataSource(_appointments),
        onTap: (CalendarTapDetails details) {
          if (details.targetElement == CalendarElement.calendarCell) {
            _selectedDate = details.date!;
            _handleDateTap();
          }
        },
      ),
    );
  }
}

class AppointmentDataSource extends CalendarDataSource {
  AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
