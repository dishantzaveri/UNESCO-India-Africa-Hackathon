import 'package:flutter/material.dart';
import 'package:partograph/constants/enum.dart';
import 'package:partograph/model/admission_informations.dart';
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
import 'package:partograph/service/heart_rate_service.dart';
import 'package:partograph/service/mother_service.dart';

class MotherProvider with ChangeNotifier {
  List<Mother> _motherList = [];
  bool _loadingMotherData = false;
  bool _postingHeartRateData = false;
  bool _postingMotherData = false;
  bool _postingAdmissionInformationData = false;

//getters
  List<Mother> get motherList => _motherList;
  bool get isLoadingMotherData => _loadingMotherData;
  bool get postingHeartRateData => _postingHeartRateData;
  bool get postingMotherData => _postingMotherData;
  bool get postingAdmissionInformationData => _postingAdmissionInformationData;

  ///Constructor users
  MotherProvider();

  //fetch methods
  loadMothers() async {
    _loadingMotherData = true;
    notifyListeners();

    try {
      _motherList = await motherServer.fetchMotherList();
    } finally {
      _loadingMotherData = false;
      notifyListeners();
    }
  }

  List<Mother> motherByCategory({required CaseCategory caseCategory}) {
    return _motherList
        .where((mother) => mother.caseCategory == caseCategory)
        .toList();
  }

  List<Mother> currentPatients(
      {CaseCategory? caseCategory, bool reverse = false}) {
    if (caseCategory != null) {
      return _motherList
          .where((mother) => mother.caseCategory == caseCategory)
          .toList();
    }

    if (reverse) {
      return _motherList.reversed.toList();
    } else {
      return _motherList;
    }
  }

  Future<bool> postMother(Mother mother) async {
    _postingMotherData = true;
    bool _hasError = true;
    notifyListeners();

    try {
      await motherServer.postMother(mother: mother);
      _hasError = false;
    } catch (e) {
      _hasError = true;
    } finally {
      _postingMotherData = false;
      notifyListeners();
    }
    return _hasError;
  }

  postHeartRate(
    HeartRate heartRate,
    Mother mother,
  ) async {
    _postingHeartRateData = true;
    notifyListeners();
    try {
      heartRateServer.postHeartRate(
          heartRate: heartRate,
          partographId: mother.admissionInformations.last.partograph!.id);
      _motherList
          .firstWhere((element) => element == mother)
          .admissionInformations
          .last
          .partograph!
          .heartRate
          .add(heartRate);
    } finally {
      _postingHeartRateData = false;
    }

    notifyListeners();
  }

  postAmniotiFluid(AmnioticFluid amnioticFluid, Mother mother) async {
    _motherList
        .firstWhere((element) => element == mother)
        .admissionInformations
        .last
        .partograph!
        .amnioticFluid
        .add(amnioticFluid);
    notifyListeners();
  }

  postMoulding(MouldingFetal mouldingFetal, Mother mother) async {
    _motherList
        .firstWhere((element) => element == mother)
        .admissionInformations
        .last
        .partograph!
        .mouldingFetal
        .add(mouldingFetal);
    notifyListeners();
  }

  postDilatation(Dilatation dilatation, Mother mother) async {
    _motherList
        .firstWhere((element) => element == mother)
        .admissionInformations
        .last
        .partograph!
        .dilatation
        .add(dilatation);
    notifyListeners();
  }

  postDescent(Descent descent, Mother mother) async {
    _motherList
        .firstWhere((element) => element == mother)
        .admissionInformations
        .last
        .partograph!
        .descent
        .add(descent);
    notifyListeners();
  }

  postUterineContractions(
      UterineContraction uterineContraction, Mother mother) async {
    _motherList
        .firstWhere((element) => element == mother)
        .admissionInformations
        .last
        .partograph!
        .uterineContractions
        .add(uterineContraction);
    notifyListeners();
  }

  postBloodPressure(BloodPressure bloodPressure, Mother mother) async {
    _motherList
        .firstWhere((element) => element == mother)
        .admissionInformations
        .last
        .partograph!
        .bloodPressure
        .add(bloodPressure);
    notifyListeners();
  }

  postPulse(Pulse pulse, Mother mother) async {
    _motherList
        .firstWhere((element) => element == mother)
        .admissionInformations
        .last
        .partograph!
        .pulse
        .add(pulse);
    notifyListeners();
  }

  postTemperature(Temperature temperature, Mother mother) async {
    _motherList
        .firstWhere((element) => element == mother)
        .admissionInformations
        .last
        .partograph!
        .temperature
        .add(temperature);
    notifyListeners();
  }

  postUrine(Urine urine, Mother mother) async {
    _motherList
        .firstWhere((element) => element == mother)
        .admissionInformations
        .last
        .partograph!
        .urine
        .add(urine);
    notifyListeners();
  }

  postOxytocin(Oxytocin oxytocin, Mother mother) async {
    _motherList
        .firstWhere((element) => element == mother)
        .admissionInformations
        .last
        .partograph!
        .oxytocin
        .add(oxytocin);
    notifyListeners();
  }

  postDrugIvFluids(DrugIvFluid drugIvFluid, Mother mother) async {
    _motherList
        .firstWhere((element) => element == mother)
        .admissionInformations
        .last
        .partograph!
        .drugIvFluid
        .add(drugIvFluid);
    notifyListeners();
  }

  Future<bool> postAdmissionInformation(
      AdmissionInformation admissionInformation, int motherId) async {
    _postingAdmissionInformationData = true;
    bool _hasError = true;
    notifyListeners();

    try {
      await motherServer.postAdmissionInformation(
          admissionInformation: admissionInformation, motherId:motherId);
      _hasError = false;
    } catch (e) {
      _hasError = true;
    } finally {
      _postingAdmissionInformationData = false;
      notifyListeners();
    }
    return _hasError;
  }
}
