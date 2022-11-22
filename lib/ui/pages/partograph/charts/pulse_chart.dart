import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PulseChartGraph extends StatefulWidget {
  const PulseChartGraph({Key? key}) : super(key: key);

  @override
  State<PulseChartGraph> createState() => _PulseChartGraphState();
}

class _PulseChartGraphState extends State<PulseChartGraph> {
  _PulseChartGraphState();

  TooltipBehavior? _tooltipBehavior;
  @override
  void initState() {
    _tooltipBehavior =
        TooltipBehavior(enable: true, header: '', canShowMarker: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildDefaultRangeColumnChart();
  }

  /// Returns the default range column chart.
  SfCartesianChart _buildDefaultRangeColumnChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: 'Pulse'),
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
          axisLine: const AxisLine(width: 0),
          interval: 5,
          labelFormat: '{value} B/P',
          majorTickLines: const MajorTickLines(size: 0)),
      series: _getDefaultRangeColumnSeries(),
      tooltipBehavior: _tooltipBehavior,
    );
  }

  /// Retursn the list of chart series
  /// which need to render on the default range column chart.
  List<RangeColumnSeries<ChartSampleData, String>>
      _getDefaultRangeColumnSeries() {
    return <RangeColumnSeries<ChartSampleData, String>>[
      RangeColumnSeries<ChartSampleData, String>(
        dataSource: <ChartSampleData>[
          ChartSampleData(x: '1', y: 3, yValue: 6),
          ChartSampleData(x: '2', y: 3, yValue: 7),
          ChartSampleData(x: '3', y: 4, yValue: 10),
          ChartSampleData(x: '4', y: 6, yValue: 13),
          ChartSampleData(x: '5', y: 9, yValue: 17),
          ChartSampleData(x: '6', y: 12, yValue: 20),
        ],
        xValueMapper: (ChartSampleData sales, _) => sales.x,
        lowValueMapper: (ChartSampleData sales, _) => sales.y,
        highValueMapper: (ChartSampleData sales, _) => sales.yValue,
        dataLabelSettings: const DataLabelSettings(
            isVisible: true,
            labelAlignment: ChartDataLabelAlignment.top,
            textStyle: TextStyle(fontSize: 10)),
      )
    ];
  }
}

class ChartSampleData {
  final String x;
  final int y;
  final int yValue;

  ChartSampleData({required this.x, required this.y, required this.yValue});
}
