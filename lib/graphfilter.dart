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
          title: const Text('Syncfusion Chart Example'),
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
  List<Map<String, dynamic>> apiResponse =[

{
"practiceId": 21,
"userId": 8,
"subEventId": 9,
"performance": 11.36,
"session": "Morning",
"remarks": null,
"warmUpWorkoutHeaderId": null,
"academyId": 2,
"coachId": 7,
"createBy": 7,
"createDate": "2023-12-31",
"modifyDate": "2024-01-04"
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
        startDate = currentDate.subtract(const Duration(days: 7));
        break;
      case FilterType.month:
        startDate = currentDate.subtract(const Duration(days: 30));
        break;
      case FilterType.year:
        startDate = currentDate.subtract(const Duration(days: 365));
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
      primaryYAxis: NumericAxis(isInversed: true),
      series: <ChartSeries>[
        SplineSeries<ChartData, DateTime>(
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

    if (picked != null) {
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
