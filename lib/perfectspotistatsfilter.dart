import 'package:flutter/material.dart';
import 'package:flutter_research/practicejson.dart';
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
          title: const Text('Data Filtering Example'),
        ),
        body: MyFilteringWidget(),
      ),
    );
  }
}
// PracticeJson pjs = PracticeJson();
class MyFilteringWidget extends StatefulWidget {
  @override
  _MyFilteringWidgetState createState() => _MyFilteringWidgetState();
}

class _MyFilteringWidgetState extends State<MyFilteringWidget> {

  List<Map<String, dynamic>> data = PracticeJson().data;
  // Default filter values
  int selectedSubEventId = 9;
  String selectedDateFilter = "All";
  DateTime selectedStartDate = DateTime.now().subtract(const Duration(days: 7));
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
              child: const Icon(Icons.arrow_left),
            ),
            const SizedBox(width: 16),
            Text(
              "${_formatDate(selectedStartDate)} - ${_formatDate(selectedEndDate)}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 16),
            GestureDetector(
              onTap: () {
                if (selectedDateFilter != "All") {
                  setState(() {
                    selectedStartDate = selectedStartDate.add(_getDateIncrement());
                    selectedEndDate = selectedEndDate.add(_getDateIncrement());
                  });
                }
              },
              child: const Icon(Icons.arrow_right),
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
        return practiceDate.isAfter(selectedStartDate) && practiceDate.isBefore(selectedEndDate.add(const Duration(days: 1)));
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
      selectedStartDate = now.subtract(const Duration(days: 7));
      selectedEndDate = now;
    } else if (selectedDateFilter == "Monthly") {
      selectedStartDate = DateTime(now.year, now.month, 1);
      selectedEndDate = DateTime(now.year, now.month + 1, 1).subtract(const Duration(days: 1));
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
      return const Duration(days: 7);
    } else if (selectedDateFilter == "Monthly") {
      return const Duration(days: 30);
    } else if (selectedDateFilter == "Yearly") {
      return const Duration(days: 365);
    }
    return const Duration(days: 0);
  }
}
