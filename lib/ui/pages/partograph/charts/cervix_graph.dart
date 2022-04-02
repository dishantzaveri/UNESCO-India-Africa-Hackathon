import 'package:flutter/material.dart';
import 'package:partograph/model/graph_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CervixGraph extends StatefulWidget {
  const CervixGraph({Key? key}) : super(key: key);

  @override
  State<CervixGraph> createState() => _CervixGraphState();
}

class _CervixGraphState extends State<CervixGraph> {
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
            title: ChartTitle(text: 'Crvix (cm)'),
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
