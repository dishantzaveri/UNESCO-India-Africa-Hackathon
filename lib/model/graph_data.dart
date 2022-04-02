class GraphData {
  final double yAxis;
  final int xAxis;

  GraphData({required this.yAxis, required this.xAxis});
}

List<GraphData> heartRateDataList = [
  GraphData(xAxis: 5, yAxis: 35),
  GraphData(xAxis: 10, yAxis: 28),
  GraphData(xAxis: 15, yAxis: 34),
  GraphData(xAxis: 20, yAxis: 35),
  GraphData(xAxis: 25, yAxis: 40)
];
