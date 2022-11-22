import 'package:flutter/material.dart';
import 'package:mother_and_baby/model/graph_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class FetalHeartRate extends StatefulWidget {
  const FetalHeartRate({Key? key}) : super(key: key);

  @override
  State<FetalHeartRate> createState() => _FetalHeartRateState();
}

class _FetalHeartRateState extends State<FetalHeartRate> {
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            // Chart title
            title: ChartTitle(text: 'Fetal heart rate'),
            // Enable legend
            legend: Legend(isVisible: true),
            // Enable tooltip
            tooltipBehavior: _tooltipBehavior,
            series: <LineSeries<GraphData, int>>[
          LineSeries<GraphData, int>(
              dataSource: heartRateDataList,
              xValueMapper: (GraphData sales, _) => sales.xAxis,
              yValueMapper: (GraphData sales, _) => sales.yAxis,
              // Enable data label
              dataLabelSettings: const DataLabelSettings(isVisible: true))
        ]));
  }
}
