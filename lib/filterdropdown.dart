import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PerformanceDashboard(),
    );
  }
}

class PerformanceDashboard extends StatefulWidget {
  @override
  _PerformanceDashboardState createState() => _PerformanceDashboardState();
}

class _PerformanceDashboardState extends State<PerformanceDashboard> {
  final List<ChartData> weeklyData = [
    ChartData(0, 50),
    ChartData(1, 30),
    ChartData(2, 40),
    ChartData(3, 60),
    ChartData(4, 80),
    ChartData(5, 70),
    ChartData(6, 90),
  ];

  final List<ChartData> monthlyData = [
    ChartData(0, 120),
    ChartData(1, 150),
    ChartData(2, 130),
    ChartData(3, 160),
    ChartData(4, 140),
    ChartData(5, 170),
    ChartData(6, 180),
    ChartData(7, 200),
    ChartData(8, 190),
    ChartData(9, 210),
    ChartData(10, 220),
    ChartData(11, 230),
  ];

  final List<ChartData> yearlyData = [
    ChartData(0, 100),
    ChartData(1, 120),
    ChartData(2, 130),
    ChartData(3, 110),
    ChartData(4, 140),
    ChartData(5, 150),
    ChartData(6, 160),
    ChartData(7, 180),
    ChartData(8, 170),
    ChartData(9, 190),
    ChartData(10, 200),
    ChartData(11, 220),
  ];

  final List<ChartData> dailyData = [
    ChartData(0, 20),
    ChartData(1, 25),
    ChartData(2, 30),
    ChartData(3, 35),
    ChartData(4, 40),
    ChartData(5, 45),
    ChartData(6, 50),
  ];

  List<ChartData> selectedData = [];

  @override
  void initState() {
    super.initState();
    selectedData = weeklyData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Performance Dashboard'),
      ),
      body: Column(
        children: [
          _buildFilterButtons(),
          _buildPerformanceChart(),
        ],
      ),
    );
  }

  Widget _buildFilterButtons() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildFilterButton('Weekly', () {
            setState(() {
              selectedData = weeklyData;
            });
          }),
          _buildFilterButton('Monthly', () {
            setState(() {
              selectedData = monthlyData;
            });
          }),
          _buildFilterButton('Yearly', () {
            setState(() {
              selectedData = yearlyData;
            });
          }),
          _buildFilterButton('Daily', () {
            setState(() {
              selectedData = dailyData;
            });
          }),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String text, Function() onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }

  Widget _buildPerformanceChart() {
    return Container(
      height: 300,
      padding: EdgeInsets.all(16.0),
      child: SfCartesianChart(
        primaryXAxis: NumericAxis(),
        primaryYAxis: NumericAxis(),
        series: <ChartSeries>[
          LineSeries<ChartData, num>(
            dataSource: selectedData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            name: 'Performance',
          ),
        ],
        
      ),
    );
  }
}

class ChartData {
  final num x;
  final double y;

  ChartData(this.x, this.y);
}
