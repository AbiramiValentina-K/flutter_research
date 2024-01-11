import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bar Series Example'),
        ),
        body: Center(
          child: BarChart(),
        ),
      ),
    );
  }
}

class BarChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(
        title: AxisTitle(text: 'Categories'),
      ),
      isTransposed: true,
      primaryYAxis: NumericAxis(
        title: AxisTitle(text: 'Values'),
        minimum: 14.9, // Performance - 1
        maximum: 8.49, // World + 1
        // minimum:  8.49, // Performance - 1
        // maximum:14.9, // World + 1
        isInversed: true,
        
      ),
      series: <BarSeries<Map<String, dynamic>, String>>[
        BarSeries<Map<String, dynamic>, String>(
          dataSource: [
            {'type': 'World', 'value': 10.49},
            {'type': 'National', 'value': 10.25},
            {'type': 'State', 'value': 12.2},
            {'type': 'Performance', 'value': 12.9},
          ],
          xValueMapper: (Map<String, dynamic> data, _) => data['type'],
          yValueMapper: (Map<String, dynamic> data, _) => data['value'],
          dataLabelSettings: DataLabelSettings(isVisible: true),
        ),
      ],
    );
  }
}
