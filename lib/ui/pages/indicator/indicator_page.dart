import 'package:flutter/material.dart';
import 'package:mother_and_baby/model/indicator.dart';
import 'package:mother_and_baby/model/mother.dart';
import 'package:mother_and_baby/ui/pages/indicator/List/amniotic_fluid_list.dart';
import 'package:mother_and_baby/ui/pages/indicator/List/fetal_heart_rate_list.dart';
import 'package:mother_and_baby/ui/pages/indicator/List/labour_progress_list.dart';
import 'package:mother_and_baby/ui/pages/indicator/List/mother_conditon_list.dart';
import 'package:mother_and_baby/ui/pages/indicator/forms/fetal_heart_rate_form.dart';
import 'package:mother_and_baby/ui/pages/indicator/forms/moduling_form.dart';
import 'package:mother_and_baby/ui/pages/indicator/forms/mother_condition_form.dart';
import 'package:mother_and_baby/ui/widgets/timer_widget.dart';

class IndicatorPage extends StatelessWidget {
  const IndicatorPage({Key? key, required this.indicator, required this.mother})
      : super(key: key);
  final Indicator indicator;
  final Mother mother;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(indicator.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const TimerWidget(),
            _getIndicatorList()
          ],
        ),
      ),
    );
  }

  _getIndicatorList() {
    switch (indicator.title) {
      case "Fetal heart rate":
        return FetalHeartRateList(
          mother: mother,
        );
      case "Amniotic fluid & Moulding":
        return AmnioticFuildList(
          mother: mother,
        );
      case "Labour Progress":
        return LabourProcessList(
          mother: mother,
        );
      case "Mother's condition":
        return MotherConditionList(
          mother: mother,
        );
      default:
    }
  }

  _getIndicatorForm() {
    switch (indicator.title) {
      case "Fetal heart rate":
        return FetalHeartRateForm(
          mother: mother,
        );
      case "Amniotic fluid & Moulding":
        return ModulingForm(
          mother: mother,
        );
      case "Mother's condition":
        return const MotherConditionForm();
      default:
    }
  }

  showDialogForm(context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
            title: Text(indicator.title),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16))),
            content: _getIndicatorForm(),
          );
        });
  }
}
