import 'package:flutter/material.dart';
import 'package:charts_painter/chart.dart';

class FetalHeartRate extends StatelessWidget {
  const FetalHeartRate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chart(
      state: ChartState.line(
        ChartData.fromList(
          <double>[1 ,2,4,5,8,6,7,]
              .map((e) => BubbleValue<void>(e))
              .toList(),
          axisMax: 9.0,
        ),
        itemOptions: BubbleItemOptions(
          maxBarWidth: 6.0,
          colorForKey: (item, key) {
            return [Colors.black, Colors.red, Colors.blue][key];
          },
        ),
         backgroundDecorations: [
            GridDecoration(
              verticalAxisStep: 1,
              horizontalAxisStep: 1,
            ),
          ],
      ),
    );
  }
}
