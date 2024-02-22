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
          title: Text('World Record Comparison'),
        ),
        body: Center(
          child: Container(
            height: 400,
            child: WorldRecordChart(),
          ),
        ),
      ),
    );
  }
}

class WorldRecordChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      series: <ChartSeries>[
        SplineSeries<Map<String, dynamic>, String>(
          dataSource: [
            {'Score': 'You', 'Percentage Close': -27.55}, // Your score
            {'Score': 'World Record', 'Percentage Close': 0}, // World record
          ],
          xValueMapper: (datum, _) => datum['Score'] as String,
          yValueMapper: (datum, _) => datum['Percentage Close'] as double,
          markerSettings: MarkerSettings(isVisible: true),
          dataLabelSettings: DataLabelSettings(isVisible: true),
        ),
      ],
      title: ChartTitle(text: 'Percentage Close to World Record'),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }
}
