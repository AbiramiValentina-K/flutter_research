import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'data/practicejson.dart';

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

class MyFilteringWidget extends StatefulWidget {
  @override
  _MyFilteringWidgetState createState() => _MyFilteringWidgetState();
}

class _MyFilteringWidgetState extends State<MyFilteringWidget> {
  List<Map<String, dynamic>> data = PracticeJson().data;
  int selectedSubEventId = 5;
  Calendar selectedDateFilter = Calendar.all;
  DateTime selectedStartDate = DateTime.now().subtract(const Duration(days: 7));
  DateTime selectedEndDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredData = filterData();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DropdownButton<int>(
          value: selectedSubEventId,
          items: [5, 9, 10].map((eventId) {
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

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: SegmentedButton<Calendar>(
            segments: const <ButtonSegment<Calendar>>[
              ButtonSegment<Calendar>(
                  value: Calendar.day,
                  tooltip: "Day",
                  // label: Text('Day'),
                  icon: Icon(Icons.calendar_view_day)),
              ButtonSegment<Calendar>(
                  value: Calendar.week,
                  tooltip: "Week",
                  // label: Text('Week'),
                  icon: Icon(Icons.calendar_view_week)),
              ButtonSegment<Calendar>(
                  value: Calendar.month,
                  tooltip: "Month",
                  // label: Text('Month'),
                  icon: Icon(Icons.calendar_view_month)),
              ButtonSegment<Calendar>(
                  value: Calendar.year,
                  tooltip: "Year",
                  // label: Text('Year'),
                  icon: Icon(Icons.calendar_today)),
              ButtonSegment<Calendar>(
                  value: Calendar.all,
                  tooltip: "All",
                  // label: Text('All'),
                  icon: Icon(Icons.event_note)),
              ButtonSegment<Calendar>(
                  value: Calendar.custom,
                  tooltip: "Custom",
                  // label: Text('Custom'),
                  icon: Icon(Icons.date_range))
            ],
            selected: <Calendar>{selectedDateFilter},
            onSelectionChanged: (Set<Calendar> newSelection) {
              setState(() {
                selectedDateFilter = newSelection.first;
                if (selectedDateFilter == Calendar.custom) {
                  _selectDateRange(context);
                } else {
                  updateDateRange();
                }
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                if (selectedDateFilter != Calendar.all) {
                  setState(() {
                    selectedStartDate =
                        selectedStartDate.subtract(_getDateIncrement());
                    selectedEndDate =
                        selectedEndDate.subtract(_getDateIncrement());
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
                if (selectedDateFilter != Calendar.all) {
                  setState(() {
                    selectedStartDate =
                        selectedStartDate.add(_getDateIncrement());
                    selectedEndDate = selectedEndDate.add(_getDateIncrement());
                  });
                }
              },
              child: const Icon(Icons.arrow_right),
            ),
          ],
        ),
        // Display Syncfusion Chart
        Container(
          height: 300,
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            series: <ChartSeries>[
              LineSeries<Map<String, dynamic>, String>(
                dataSource: filteredData,
                xValueMapper: (Map<String, dynamic> data, _) =>
                    data['createDate'].toString(),
                yValueMapper: (Map<String, dynamic> data, _) =>
                    data['performance'],
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<Map<String, dynamic>> filterData() {
    List<Map<String, dynamic>> result = data;

    result = result
        .where((item) => item['subEventId'] == selectedSubEventId)
        .toList();

    if (selectedDateFilter == Calendar.week ||
        selectedDateFilter == Calendar.month ||
        selectedDateFilter == Calendar.year) {
      result = result.where((item) {
        DateTime practiceDate = DateTime.parse(item['createDate']);
        return practiceDate.isAfter(selectedStartDate) &&
            practiceDate.isBefore(selectedEndDate.add(const Duration(days: 1)));
      }).toList();
    } else if (selectedDateFilter == Calendar.custom) {
      result = result.where((item) {
        DateTime practiceDate = DateTime.parse(item['createDate']);
        return practiceDate.isAfter(selectedStartDate) &&
            practiceDate.isBefore(selectedEndDate.add(const Duration(days: 1)));
      }).toList();
    }

    return result;
  }

  void updateDateRange() {
    DateTime now = DateTime.now();
    if (selectedDateFilter == Calendar.week) {
      selectedStartDate = now.subtract(const Duration(days: 7));
      selectedEndDate = now;
    } else if (selectedDateFilter == Calendar.month) {
      selectedStartDate = DateTime(now.year, now.month, 1);
      selectedEndDate = DateTime(now.year, now.month + 1, 1)
          .subtract(const Duration(days: 1));
    } else if (selectedDateFilter == Calendar.year) {
      selectedStartDate = DateTime(now.year, 1, 1);
      selectedEndDate = DateTime(now.year, 12, 31);
    }
  }

  String _formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  Duration _getDateIncrement() {
    if (selectedDateFilter == Calendar.week) {
      return const Duration(days: 7);
    } else if (selectedDateFilter == Calendar.month) {
      return const Duration(days: 30);
    } else if (selectedDateFilter == Calendar.year) {
      return const Duration(days: 365);
    }
    return const Duration(days: 0);
  }

  Future<void> _selectDateRange(BuildContext context) async {
    DateTimeRange? picked = await showDateRangePicker(
      context: context,
      initialDateRange:
          DateTimeRange(start: selectedStartDate, end: selectedEndDate),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        selectedStartDate = picked.start;
        selectedEndDate = picked.end;
      });
    } else {
      setState(() {
        selectedDateFilter = Calendar.all;
      });
    }
  }
}

enum Calendar { day, week, month, year, all, custom }

class SingleChoice extends StatefulWidget {
  const SingleChoice(
      {super.key, required Null Function(dynamic value) onChanged});

  @override
  State<SingleChoice> createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  Calendar calendarView = Calendar.day;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Calendar>(
      segments: const <ButtonSegment<Calendar>>[
        ButtonSegment<Calendar>(
            value: Calendar.day,
            tooltip: "Day",
            // label: Text('Day'),
            icon: Icon(Icons.calendar_view_day)),
        ButtonSegment<Calendar>(
            value: Calendar.week,
            tooltip: "Week",
            // label: Text('Week'),
            icon: Icon(Icons.calendar_view_week)),
        ButtonSegment<Calendar>(
            value: Calendar.month,
            tooltip: "Month",
            // label: Text('Month'),
            icon: Icon(Icons.calendar_view_month)),
        ButtonSegment<Calendar>(
            value: Calendar.year,
            tooltip: "Year",
            // label: Text('Year'),
            icon: Icon(Icons.calendar_today)),
        ButtonSegment<Calendar>(
            value: Calendar.all,
            tooltip: "All",
            // label: Text('All'),
            icon: Icon(Icons.event_note)),
        ButtonSegment<Calendar>(
            value: Calendar.custom,
            tooltip: "Custom",
            // label: Text('Custom'),
            icon: Icon(Icons.date_range))
      ],
      selected: <Calendar>{calendarView},
      onSelectionChanged: (Set<Calendar> newSelection) {
        setState(() {
          // By default there is only a single segment that can be
          // selected at one time, so its value is always the first
          // item in the selected set.

          calendarView = newSelection.first;
        });
      },
    );
  }
}
