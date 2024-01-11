import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Data Filtering Example'),
        ),
        body: MyFilteringWidget(),
      ),
    );
  }
}

class MyFilteringWidget extends StatefulWidget {
  @override
  _MyFilteringWidgetState createState() => _MyFilteringWidgetState();
}

class _MyFilteringWidgetState extends State<MyFilteringWidget> {
  List<Map<String, dynamic>> data = [
    {
        "practiceId": 1,
        "userId": 8,
        "subEventId": 9,
        "performance": 12.23,
        "session": "Morning",
        "remarks": null,
        "warmUpWorkoutHeaderId": null,
        "academyId": 2,
        "coachId": 8,
        "createBy": 8,
        "createDate": "2023-09-12",
        "modifyDate": "2023-12-30"
    },
    {
        "practiceId": 2,
        "userId": 8,
        "subEventId": 9,
        "performance": 11.71,
        "session": "Morning",
        "remarks": null,
        "warmUpWorkoutHeaderId": null,
        "academyId": 2,
        "coachId": 8,
        "createBy": 8,
        "createDate": "2023-12-30",
        "modifyDate": "2023-12-30"
    },
    {
        "practiceId": 3,
        "userId": 8,
        "subEventId": 9,
        "performance": 11.85,
        "session": "Morning",
        "remarks": null,
        "warmUpWorkoutHeaderId": null,
        "academyId": 2,
        "coachId": 8,
        "createBy": 8,
        "createDate": "2023-11-23",
        "modifyDate": "2023-12-30"
    },
    {
        "practiceId": 4,
        "userId": 8,
        "subEventId": 9,
        "performance": 12.03,
        "session": "Morning",
        "remarks": null,
        "warmUpWorkoutHeaderId": null,
        "academyId": 2,
        "coachId": 8,
        "createBy": 8,
        "createDate": "2023-10-11",
        "modifyDate": "2023-12-30"
    },
    {
        "practiceId": 5,
        "userId": 8,
        "subEventId": 9,
        "performance": 12.08,
        "session": "Morning",
        "remarks": null,
        "warmUpWorkoutHeaderId": null,
        "academyId": 2,
        "coachId": 8,
        "createBy": 8,
        "createDate": "2023-09-28",
        "modifyDate": "2023-12-30"
    },
    {
        "practiceId": 6,
        "userId": 8,
        "subEventId": 9,
        "performance": 12.5,
        "session": "Morning",
        "remarks": null,
        "warmUpWorkoutHeaderId": null,
        "academyId": 2,
        "coachId": 8,
        "createBy": 8,
        "createDate": "2023-08-15",
        "modifyDate": "2023-12-30"
    },
    {
        "practiceId": 7,
        "userId": 8,
        "subEventId": 9,
        "performance": 12.23,
        "session": "Morning",
        "remarks": null,
        "warmUpWorkoutHeaderId": null,
        "academyId": 2,
        "coachId": 8,
        "createBy": 8,
        "createDate": "2023-08-07",
        "modifyDate": "2023-12-30"
    },
    {
        "practiceId": 8,
        "userId": 8,
        "subEventId": 9,
        "performance": 11.65,
        "session": "Morning",
        "remarks": null,
        "warmUpWorkoutHeaderId": null,
        "academyId": 2,
        "coachId": 8,
        "createBy": 8,
        "createDate": "2023-12-27",
        "modifyDate": "2023-12-30"
    },
    {
        "practiceId": 10,
        "userId": 8,
        "subEventId": 9,
        "performance": 11.92,
        "session": "Morning",
        "remarks": null,
        "warmUpWorkoutHeaderId": null,
        "academyId": 2,
        "coachId": 8,
        "createBy": 8,
        "createDate": "2023-12-21",
        "modifyDate": "2023-12-30"
    },
    {
        "practiceId": 11,
        "userId": 8,
        "subEventId": 9,
        "performance": 11.87,
        "session": "Morning",
        "remarks": null,
        "warmUpWorkoutHeaderId": null,
        "academyId": 2,
        "coachId": 8,
        "createBy": 8,
        "createDate": "2023-12-17",
        "modifyDate": "2023-12-30"
    },
    {
        "practiceId": 12,
        "userId": 8,
        "subEventId": 9,
        "performance": 11.96,
        "session": "Morning",
        "remarks": null,
        "warmUpWorkoutHeaderId": null,
        "academyId": 2,
        "coachId": 8,
        "createBy": 8,
        "createDate": "2023-12-13",
        "modifyDate": "2023-12-30"
    },
    {
        "practiceId": 14,
        "userId": 8,
        "subEventId": 9,
        "performance": 11.87,
        "session": "Morning",
        "remarks": null,
        "warmUpWorkoutHeaderId": null,
        "academyId": 2,
        "coachId": 8,
        "createBy": 8,
        "createDate": "2023-12-07",
        "modifyDate": "2023-12-30"
    },
    {
        "practiceId": 15,
        "userId": 8,
        "subEventId": 9,
        "performance": 11.83,
        "session": "Morning",
        "remarks": null,
        "warmUpWorkoutHeaderId": null,
        "academyId": 2,
        "coachId": 8,
        "createBy": 8,
        "createDate": "2023-12-01",
        "modifyDate": "2023-12-30"
    },
    {
        "practiceId": 16,
        "userId": 8,
        "subEventId": 9,
        "performance": 11.82,
        "session": "Morning",
        "remarks": null,
        "warmUpWorkoutHeaderId": null,
        "academyId": 2,
        "coachId": 8,
        "createBy": 8,
        "createDate": "2023-11-30",
        "modifyDate": "2023-12-30"
    },
    {
        "practiceId": 17,
        "userId": 8,
        "subEventId": 9,
        "performance": 12.05,
        "session": "Morning",
        "remarks": null,
        "warmUpWorkoutHeaderId": null,
        "academyId": 2,
        "coachId": 8,
        "createBy": 8,
        "createDate": "2023-11-15",
        "modifyDate": "2023-12-30"
    },
    {
        "practiceId": 18,
        "userId": 8,
        "subEventId": 9,
        "performance": 12.036,
        "session": "Morning",
        "remarks": null,
        "warmUpWorkoutHeaderId": null,
        "academyId": 2,
        "coachId": 8,
        "createBy": 8,
        "createDate": "2023-11-17",
        "modifyDate": "2023-12-30"
    },
    {
        "practiceId": 19,
        "userId": 8,
        "subEventId": 9,
        "performance": 12.69,
        "session": "Morning",
        "remarks": null,
        "warmUpWorkoutHeaderId": null,
        "academyId": 2,
        "coachId": 8,
        "createBy": 8,
        "createDate": "2023-10-19",
        "modifyDate": "2023-12-30"
    },
    {
        "practiceId": 20,
        "userId": 8,
        "subEventId": 10,
        "performance": 24.25,
        "session": "Evening",
        "remarks": null,
        "warmUpWorkoutHeaderId": null,
        "academyId": 2,
        "coachId": 7,
        "createBy": 8,
        "createDate": "2024-01-01",
        "modifyDate": "2024-01-01"
    }
];

  // Default filter values
  int selectedSubEventId = 9;
  String selectedDateFilter = "All";
  DateTime selectedStartDate = DateTime.now().subtract(Duration(days: 7));
  DateTime selectedEndDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    // Filter the data based on the selected criteria
    List<Map<String, dynamic>> filteredData = filterData();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Dropdown for SubEventId
        DropdownButton<int>(
          value: selectedSubEventId,
          items: [9, 10].map((eventId) {
            return DropdownMenuItem<int>(
              value: eventId,
              child: Text('SubEvent $eventId'),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              selectedSubEventId = newValue!;
            });
          },
        ),
        // Dropdown for Date filter
        DropdownButton<String>(
          value: selectedDateFilter,
          items: ["All", "Weekly", "Monthly", "Yearly", "Custom"].map((filter) {
            return DropdownMenuItem<String>(
              value: filter,
              child: Text(filter),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              selectedDateFilter = newValue!;
              updateDateRange(); // Update date range when the filter changes
            });
          },
        ),
        // Date range selection
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                if (selectedDateFilter != "All") {
                  setState(() {
                    selectedStartDate = selectedStartDate.subtract(_getDateIncrement());
                    selectedEndDate = selectedEndDate.subtract(_getDateIncrement());
                  });
                }
              },
              child: Icon(Icons.arrow_left),
            ),
            SizedBox(width: 16),
            Text(
              _formatDate(selectedStartDate) + " - " + _formatDate(selectedEndDate),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 16),
            GestureDetector(
              onTap: () {
                if (selectedDateFilter != "All") {
                  setState(() {
                    selectedStartDate = selectedStartDate.add(_getDateIncrement());
                    selectedEndDate = selectedEndDate.add(_getDateIncrement());
                  });
                }
              },
              child: Icon(Icons.arrow_right),
            ),
          ],
        ),
        // Display filtered data
        Expanded(
          child: ListView.builder(
            itemCount: filteredData.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("Performance: ${filteredData[index]['performance']}"),
                subtitle: Text("Date: ${filteredData[index]['createDate']}"),
              );
            },
          ),
        ),
      ],
    );
  }

  List<Map<String, dynamic>> filterData() {
    // Implement your filtering logic here based on the selected criteria
    List<Map<String, dynamic>> result = data;

    // Filter based on subEventId
    result = result.where((item) => item['subEventId'] == selectedSubEventId).toList();

    // Filter based on date range (if applicable)
    if (selectedDateFilter == "Weekly" || selectedDateFilter == "Monthly" || selectedDateFilter == "Yearly") {
      result = result.where((item) {
        DateTime practiceDate = DateTime.parse(item['createDate']);
        return practiceDate.isAfter(selectedStartDate) && practiceDate.isBefore(selectedEndDate.add(Duration(days: 1)));
      }).toList();
    } else if (selectedDateFilter == "Custom") {
      // Implement custom date range filtering logic
    }

    return result;
  }

  void updateDateRange() {
    // Update date range based on the selected filter
    DateTime now = DateTime.now();
    if (selectedDateFilter == "Weekly") {
      selectedStartDate = now.subtract(Duration(days: 7));
      selectedEndDate = now;
    } else if (selectedDateFilter == "Monthly") {
      selectedStartDate = DateTime(now.year, now.month, 1);
      selectedEndDate = DateTime(now.year, now.month + 1, 1).subtract(Duration(days: 1));
    } else if (selectedDateFilter == "Yearly") {
      selectedStartDate = DateTime(now.year, 1, 1);
      selectedEndDate = DateTime(now.year, 12, 31);
    }
  }

  String _formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  Duration _getDateIncrement() {
    if (selectedDateFilter == "Weekly") {
      return Duration(days: 7);
    } else if (selectedDateFilter == "Monthly") {
      return Duration(days: 30);
    } else if (selectedDateFilter == "Yearly") {
      return Duration(days: 365);
    }
    return Duration(days: 0);
  }
}
