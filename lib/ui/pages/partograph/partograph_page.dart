import 'package:flutter/material.dart';

import 'charts/fetal_heart_rate_graph.dart';

class PartographPage extends StatelessWidget {
  const PartographPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Partograph"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [FetalHeartRate()],
        ),
      ),
    );
  }
}
