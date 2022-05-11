import 'package:flutter/material.dart';
import 'package:partograph/model/mother.dart';
import 'package:partograph/provider/mother_provider.dart';
import 'package:partograph/ui/pages/indicator/List/widget/blood_pressure_card.dart';
import 'package:partograph/ui/pages/indicator/List/widget/drug_iv_fluids_card.dart';
import 'package:partograph/ui/pages/indicator/List/widget/oxytocin_card.dart';
import 'package:partograph/ui/pages/indicator/List/widget/pulse_card.dart';
import 'package:partograph/ui/pages/indicator/List/widget/temperature_card.dart';
import 'package:partograph/ui/pages/indicator/List/widget/urine_card.dart';
import 'package:provider/provider.dart';

class MotherConditionList extends StatelessWidget {
  const MotherConditionList({Key? key, required this.mother}) : super(key: key);
  final Mother mother;
  @override
  Widget build(BuildContext context) {
    final _motherProvider = Provider.of<MotherProvider>(context);
    return Column(
      children: [
        OxytocinCard(
            oxytocin: _motherProvider.motherList
                .firstWhere((element) => element == mother)
                .admissionInformations
                .last
                .partograph
                .oxytocin,
            mother: mother),
        DrugsIvFluidCard(
            drugIvFluid: _motherProvider.motherList
                .firstWhere((element) => element == mother)
                .admissionInformations
                .last
                .partograph
                .drugIvFluid,
            mother: mother),
        BloodPresureCard(
            bloodPressure: _motherProvider.motherList
                .firstWhere((element) => element == mother)
                .admissionInformations
                .last
                .partograph
                .bloodPressure,
            mother: mother),
        PulseCard(
          mother: mother,
          pulses: _motherProvider.motherList
              .firstWhere((element) => element == mother)
              .admissionInformations
              .last
              .partograph
              .pulse,
        ),
        TemperatureCard(
            temperature: _motherProvider.motherList
                .firstWhere((element) => element == mother)
                .admissionInformations
                .last
                .partograph
                .temperature,
            mother: mother),
        UrineCard(
            urine: _motherProvider.motherList
                .firstWhere((element) => element == mother)
                .admissionInformations
                .last
                .partograph
                .urine,
            mother: mother)
      ],
    );
  }
}
