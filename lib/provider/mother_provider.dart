import 'package:flutter/material.dart';
import 'package:partograph/constants/enum.dart';
import 'package:partograph/model/amniotic_fluid.dart';
import 'package:partograph/model/blood_pressure.dart';
import 'package:partograph/model/descent.dart';
import 'package:partograph/model/dilatation.dart';
import 'package:partograph/model/drug_iv_fluids.dart';
import 'package:partograph/model/heart_rate.dart';
import 'package:partograph/model/mother.dart';
import 'package:partograph/model/moulding_fetal.dart';
import 'package:partograph/model/oxytocin.dart'; 
import 'package:partograph/model/pulse.dart';
import 'package:partograph/model/temperature.dart';
import 'package:partograph/model/urine.dart';
import 'package:partograph/model/uterine_contractions.dart';

class MotherProvider with ChangeNotifier {
  final List<Mother> _motherList = [];

  ///Constructor users
  MotherProvider();
  List<Mother> get motherList => _motherList;
  List<Mother> motherByCategory({required CaseCategory caseCategory}) {
    return _motherList
        .where((mother) => mother.caseCategory == caseCategory)
        .toList();
  }

  List<Mother> currentPatients({required CaseCategory caseCategory}) {
    return _motherList
        .where((mother) => mother.caseCategory != caseCategory)
        .toList();
  }

  postMother(Mother mother) async {
    _motherList.add(mother);
    notifyListeners();
  }

  postHeartRate(HeartRate heartRate, Mother mother) async {
    _motherList
        .firstWhere((element) => element == mother)
        .admissionInformations
        .last.partograph
        .heartRate
        .add(heartRate);
    notifyListeners();
  }

  postAmniotiFluid(AmnioticFluid amnioticFluid, Mother mother) async {
    _motherList
        .firstWhere((element) => element == mother)
        .admissionInformations
        .last.partograph
        .amnioticFluid
        .add(amnioticFluid);
    notifyListeners();
  }

  postMoulding(MouldingFetal mouldingFetal, Mother mother) async {
    _motherList
        .firstWhere((element) => element == mother)
        .admissionInformations
        .last.partograph
        .mouldingFetal
        .add(mouldingFetal);
    notifyListeners();
  }

  postDilatation(Dilatation dilatation, Mother mother) async {
    _motherList
        .firstWhere((element) => element == mother)
         .admissionInformations
        .last.partograph
        .dilatation
        .add(dilatation);
    notifyListeners();
  }

  postDescent(Descent descent, Mother mother) async {
    _motherList
        .firstWhere((element) => element == mother)
        .admissionInformations
        .last.partograph
        .descent
        .add(descent);
    notifyListeners();
  }

  postUterineContractions(
      UterineContraction uterineContraction, Mother mother) async {
    _motherList
        .firstWhere((element) => element == mother)
       .admissionInformations
        .last.partograph
        .uterineContractions
        .add(uterineContraction);
    notifyListeners();
  }

  postBloodPressure(BloodPressure bloodPressure, Mother mother) async {
    _motherList
        .firstWhere((element) => element == mother)
        .admissionInformations
        .last.partograph
        .bloodPressure
        .add(bloodPressure);
    notifyListeners();
  }

  postPulse(Pulse pulse, Mother mother) async {
    _motherList
        .firstWhere((element) => element == mother)
        .admissionInformations
        .last.partograph
        .pulse
        .add(pulse);
    notifyListeners();
  }

  postTemperature(Temperature temperature, Mother mother) async {
    _motherList
        .firstWhere((element) => element == mother)
         .admissionInformations
        .last.partograph
        .temperature
        .add(temperature);
    notifyListeners();
  }

  postUrine(Urine urine, Mother mother) async {
    _motherList
        .firstWhere((element) => element == mother)
        .admissionInformations
        .last.partograph
        .urine
        .add(urine);
    notifyListeners();
  }

  postOxytocin(Oxytocin oxytocin, Mother mother) async {
    _motherList
        .firstWhere((element) => element == mother)
       .admissionInformations
        .last.partograph
        .oxytocin
        .add(oxytocin);
    notifyListeners();
  }

  postDrugIvFluids(DrugIvFluid drugIvFluid, Mother mother) async {
    _motherList
        .firstWhere((element) => element == mother)
        .admissionInformations
        .last.partograph
        .drugIvFluid
        .add(drugIvFluid);
    notifyListeners();
  }
}
