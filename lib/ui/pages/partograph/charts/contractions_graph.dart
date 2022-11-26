import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ContactionsGraph extends StatefulWidget {
  const ContactionsGraph({Key? key}) : super(key: key);

  @override
  State<ContactionsGraph> createState() => _ContactionsGraphState();
}

class _ContactionsGraphState extends State<ContactionsGraph> {
  List<_ChartData>? chartData;

  TooltipBehavior? _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior =
        TooltipBehavior(enable: true, header: '', canShowMarker: false);
    chartData = <_ChartData>[
      _ChartData('1', 50, 55, 72, 65),
      _ChartData('2', 80, 75, 70, 60),
      _ChartData('3', 35, 45, 55, 52),
      _ChartData('4', 65, 50, 70, 65),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildStackedColumn100Chart();
  }

  /// Returns the cartesian stacked column 100 chart.
  SfCartesianChart _buildStackedColumn100Chart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: 'Labour progess'),
      legend:
          Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
          rangePadding: ChartRangePadding.none,
          axisLine: const AxisLine(width: 0),
          majorTickLines: const MajorTickLines(size: 0)),
      series: _getStackedColumnSeries(),
      tooltipBehavior: _tooltipBehavior,
    );
  }

  /// Returns the list of chart series
  /// which need to render on the stacked column 1oo chart.
  List<ChartSeries<_ChartData, String>> _getStackedColumnSeries() {
    return <ChartSeries<_ChartData, String>>[
      StackedColumn100Series<_ChartData, String>(
          dataSource: chartData!,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y1,
          name: '< 20 sec - Mild'),
      StackedColumn100Series<_ChartData, String>(
          dataSource: chartData!,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y2,
          name: '20-40 sec - Moderate'),
      StackedColumn100Series<_ChartData, String>(
          dataSource: chartData!,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y3,
          name: '> 45besc Strong'),
    ];
  }

  @override
  void dispose() {
    chartData!.clear();
    super.dispose();
  }
}

/// Private class for storing the stacked column series data points.
class _ChartData {
  _ChartData(this.x, this.y1, this.y2, this.y3, this.y4);
  final String x;
  final num y1;
  final num y2;
  final num y3;
  final num y4;
}
