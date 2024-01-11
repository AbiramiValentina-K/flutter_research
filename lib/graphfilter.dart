import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Syncfusion Chart Example'),
        ),
        body: ChartPage(),
      ),
    );
  }
}

class ChartPage extends StatefulWidget {
  @override
  _ChartPageState createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  List<Map<String, dynamic>> apiResponse = [
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
        "performance": 25.0,
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

  late List<ChartData> chartData;
  FilterType filterType = FilterType.all;
  DateTime? customStartDate;
  DateTime? customEndDate;

  @override
  void initState() {
    super.initState();
    chartData = parseApiResponse(apiResponse, filterType);
  }

  List<ChartData> parseApiResponse(List<Map<String, dynamic>> apiResponse, FilterType filterType) {
    // Implement logic to filter data based on the selected filter
    // You may need to adjust the logic based on your data structure and requirements

    // Example: Filter data for the last week
    DateTime currentDate = DateTime.now();
    DateTime startDate;

    switch (filterType) {
      case FilterType.week:
        startDate = currentDate.subtract(Duration(days: 7));
        break;
      case FilterType.month:
        startDate = currentDate.subtract(Duration(days: 30));
        break;
      case FilterType.year:
        startDate = currentDate.subtract(Duration(days: 365));
        break;
      case FilterType.all:
        startDate = DateTime(2000); // A past date to include all data
        break;
      case FilterType.custom:
        startDate = customStartDate ?? DateTime(2000);
        currentDate = customEndDate ?? DateTime.now();
        break;
    }

    List<ChartData> filteredData = [];

    for (var data in apiResponse) {
      DateTime date = DateTime.parse(data['createDate']);
      if (date.isAfter(startDate) && date.isBefore(currentDate)) {
        double performance = data['performance'];
        filteredData.add(ChartData(date, performance));
      }
    }

    return filteredData;
  }

  Widget buildChart() {
    return SfCartesianChart(
      primaryXAxis: DateTimeAxis(),
      series: <ChartSeries>[
        LineSeries<ChartData, DateTime>(
          dataSource: chartData,
          xValueMapper: (ChartData data, _) => data.date,
          yValueMapper: (ChartData data, _) => data.performance,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // DropdownButton for filter
        DropdownButton<FilterType>(
          value: filterType,
          items: FilterType.values
              .map((type) => DropdownMenuItem(
                    value: type,
                    child: Text(type.toString().split('.').last),
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              filterType = value!;
              if (filterType == FilterType.custom) {
                // Show date range selector for custom filter
                _showDateRangeSelector(context);
              } else {
                chartData = parseApiResponse(apiResponse, filterType);
              }
            });
          },
        ),

        // Call the buildChart function to display the chart
        Expanded(
          child: buildChart(),
        ),
      ],
    );
  }

  Future<void> _showDateRangeSelector(BuildContext context) async {
    DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked.start != null && picked.end != null) {
      setState(() {
        customStartDate = picked.start;
        customEndDate = picked.end;
        chartData = parseApiResponse(apiResponse, FilterType.custom);
      });
    } else {
      // User canceled the date range picker
      setState(() {
        filterType = FilterType.all;
        chartData = parseApiResponse(apiResponse, filterType);
      });
    }
  }
}

class ChartData {
  final DateTime date;
  final double performance;

  ChartData(this.date, this.performance);
}

enum FilterType {
  week,
  month,
  year,
  all,
  custom,
}
