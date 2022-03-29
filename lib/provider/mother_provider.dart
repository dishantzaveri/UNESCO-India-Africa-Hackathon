import 'package:flutter/material.dart';
import 'package:partograph/model/amniotic_fluid.dart';
import 'package:partograph/model/blood_pressure.dart';
import 'package:partograph/model/descent.dart';
import 'package:partograph/model/dilatation.dart';
import 'package:partograph/model/heart_rate.dart';
import 'package:partograph/model/mother.dart';
import 'package:partograph/model/moulding_fetal.dart';
import 'package:partograph/model/partogram_recording.dart';
import 'package:partograph/model/pulse.dart';
import 'package:partograph/model/temperature.dart';
import 'package:partograph/model/urine.dart';
import 'package:partograph/model/uterine_contractions.dart';

class MotherProvider with ChangeNotifier {
  final List<Mother> _motherList = [
    Mother(
        id: 1,
        fullname: 'Mariam Kemmy',
        age: 19,
        parity: 3,
        admissionDate: DateTime.now(),
        gestationPeriod: '9 month',
        history: 'HP, BP, Malar',
        membraneRaptureTime: DateTime.now(),
        partogramRecording: [
          PartogramRecording(
              id: 1,
              amnioticFluid: [],
              heartRate: [],
              mouldingFetal: [],
              descent: [],
              dilatation: [],
              bloodPressure: [],
              drugIvFluid: [],
              urine: [],
              uterineContractions: [],
              pulse: [],
              temperature: [])
        ]),
    Mother(
        id: 2,
        fullname: 'Lusia Masai',
        age: 20,
        parity: 3,
        admissionDate: DateTime.now(),
        gestationPeriod: '9 month',
        history:
            'HP, BP, Malar hjsd hjsdh hdsjkhd jsdkhjk jkshdk jsk skdf jkdshfj jksdfh jkdfhj',
        membraneRaptureTime: DateTime.now(),
        partogramRecording: [
          PartogramRecording(
              id: 2,
              amnioticFluid: [],
              heartRate: [],
              mouldingFetal: [],
              descent: [],
              dilatation: [],
              bloodPressure: [],
              drugIvFluid: [],
              urine: [],
              uterineContractions: [],
              pulse: [],
              temperature: [])
        ]),
    Mother(
        id: 3,
        fullname: 'Maria Tressa',
        age: 20,
        parity: 3,
        admissionDate: DateTime.now(),
        gestationPeriod: '9 month',
        history:
            'HP, BP, Malar hjsd hjsdh hdsjkhd jsdkhjk jkshdk jsk skdf jkdshfj jksdfh jkdfhj',
        membraneRaptureTime: DateTime.now(),
        partogramRecording: [
          PartogramRecording(
              id: 3,
              amnioticFluid: [],
              heartRate: [],
              mouldingFetal: [],
              descent: [],
              dilatation: [],
              bloodPressure: [],
              drugIvFluid: [],
              urine: [],
              uterineContractions: [],
              pulse: [],
              temperature: [])
        ]),
  ];

  ///Constructor users
  MotherProvider();
  List<Mother> get motherList => _motherList;

  postMother(Mother mother) async {
    _motherList.add(mother);
    notifyListeners();
  }

  postHeartRate(HeartRate heartRate, Mother mother) async {
    _motherList
        .firstWhere((element) => element == mother)
        .partogramRecording
        .last
        .heartRate
        .add(heartRate);
    notifyListeners();
  }

  postAmniotiFluid(AmnioticFluid amnioticFluid, Mother mother) async {
    _motherList
        .firstWhere((element) => element == mother)
        .partogramRecording
        .last
        .amnioticFluid
        .add(amnioticFluid);
    notifyListeners();
  }

  postMoulding(MouldingFetal mouldingFetal, Mother mother) async {
    _motherList
        .firstWhere((element) => element == mother)
        .partogramRecording
        .last
        .mouldingFetal
        .add(mouldingFetal);
    notifyListeners();
  }

  postDilatation(Dilatation dilatation, Mother mother) async {
    _motherList
        .firstWhere((element) => element == mother)
        .partogramRecording
        .last
        .dilatation
        .add(dilatation);
    notifyListeners();
  }

  postDescent(Descent descent, Mother mother) async {
    _motherList
        .firstWhere((element) => element == mother)
        .partogramRecording
        .last
        .descent
        .add(descent);
    notifyListeners();
  }

  postUterineContractions(
      UterineContraction uterineContraction, Mother mother) async {
    _motherList
        .firstWhere((element) => element == mother)
        .partogramRecording
        .last
        .uterineContractions
        .add(uterineContraction);
    notifyListeners();
  }

  postBloodPressure(BloodPressure bloodPressure, Mother mother) async {
    _motherList
        .firstWhere((element) => element == mother)
        .partogramRecording
        .last
        .bloodPressure
        .add(bloodPressure);
    notifyListeners();
  }

  postPulse(Pulse pulse, Mother mother) async {
    _motherList
        .firstWhere((element) => element == mother)
        .partogramRecording
        .last
        .pulse
        .add(pulse);
    notifyListeners();
  }

  postTemperature(Temperature temperature, Mother mother) async {
    _motherList
        .firstWhere((element) => element == mother)
        .partogramRecording
        .last
        .temperature
        .add(temperature);
    notifyListeners();
  }

  postUrine(Urine urine, Mother mother) async {
    _motherList
        .firstWhere((element) => element == mother)
        .partogramRecording
        .last
        .urine
        .add(urine);
    notifyListeners();
  }
}
