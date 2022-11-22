import 'package:flutter/material.dart';
import 'package:mother_and_baby/ui/pages/partograph/charts/amniotic_fluid_moulding_graph.dart';
import 'package:mother_and_baby/ui/pages/partograph/charts/cervix_graph.dart';
import 'package:mother_and_baby/ui/pages/partograph/charts/contractions_graph.dart';
import 'package:mother_and_baby/ui/pages/partograph/charts/drugs_graph.dart';
import 'package:mother_and_baby/ui/pages/partograph/charts/oxytocin_graph.dart';
import 'package:mother_and_baby/ui/pages/partograph/charts/pulse_chart.dart';
import 'package:mother_and_baby/ui/pages/partograph/charts/temp_graph.dart';
import 'package:mother_and_baby/ui/pages/partograph/charts/urine_graph.dart';

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
          children: const [
            FetalHeartRate(),
            Divider(),
            AmnioticFluidMouldingGraph(),
            Divider(),
            CervixGraph(),
            Divider(),
            OxytocinGraph(),
            Divider(),
            ContactionsGraph(),
            Divider(),
            DrugsGraph(),
            Divider(),
            PulseChartGraph(),
            Divider(),
            TempGraph(),
            Divider(),
            UrineGraph(),
            Divider(),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
