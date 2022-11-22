import 'package:flutter/material.dart';
import 'package:mother_and_baby/constants/enum.dart';
import 'package:mother_and_baby/model/admission_informations.dart';
import 'package:mother_and_baby/model/amniotic_fluid.dart';
import 'package:mother_and_baby/model/blood_pressure.dart';
import 'package:mother_and_baby/model/complication.dart';
import 'package:mother_and_baby/model/descent.dart';
import 'package:mother_and_baby/model/dilatation.dart';
import 'package:mother_and_baby/model/drug_iv_fluids.dart';
import 'package:mother_and_baby/model/heart_rate.dart';
import 'package:mother_and_baby/model/mother.dart';
import 'package:mother_and_baby/model/moulding_fetal.dart';
import 'package:mother_and_baby/model/obstetric_history.dart';
import 'package:mother_and_baby/model/oxytocin.dart';
import 'package:mother_and_baby/model/pulse.dart';
import 'package:mother_and_baby/model/temperature.dart';
import 'package:mother_and_baby/model/urine.dart';
import 'package:mother_and_baby/model/uterine_contractions.dart';
import 'package:mother_and_baby/service/heart_rate_service.dart';
import 'package:mother_and_baby/service/mother_service.dart';

class MotherProvider with ChangeNotifier {
  List<Mother> _motherList = [];
  final List<Complication> _complicationList = [];
  bool _loadingMotherData = false;
  bool _postingHeartRateData = false;
  bool _postingMotherData = false;
  bool _postingAdmissionInformationData = false;
  bool _postingComplicationData = false;
  bool _postingObstericHistoryData = false;

  bool _deletingComplication = false;

//getters
  List<Mother> get motherList => _motherList;
  List<Complication> get complicationList => _complicationList;

  bool get isLoadingMotherData => _loadingMotherData;
  bool get postingHeartRateData => _postingHeartRateData;
  bool get postingMotherData => _postingMotherData;
  bool get postingAdmissionInformationData => _postingAdmissionInformationData;
  bool get postingObstericHistoryData => _postingObstericHistoryData;
  bool get postingComplicationData => _postingComplicationData;
  bool get deletingComplication => _deletingComplication;

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

//create a new admission
  Future<AdmissionInformation?> postAdmissionInformation(
      AdmissionInformation admissionInformation, int motherId) async {
    _postingAdmissionInformationData = true;

    notifyListeners();
    AdmissionInformation? _admissionInformation;

    try {
      await motherServer
          .postAdmissionInformation(
              admissionInformation: admissionInformation, motherId: motherId)
          .then((value) {
        _admissionInformation = value;
      });
    } finally {
      _postingAdmissionInformationData = false;
      notifyListeners();
    }
    return _admissionInformation;
  }

  //create obstetric history

  Future<ObstetricHistory?> postObstetricHistory(
      ObstetricHistory obstetricHistory, int admissionInformationId) async {
    _postingObstericHistoryData = true;

    notifyListeners();
    ObstetricHistory? _obstetricHistory;

    try {
      await motherServer
          .postObstetricHistory(
              obstetricHistory: obstetricHistory,
              admissionInformationId: admissionInformationId)
          .then((value) {
        _obstetricHistory = value;
      });
    } finally {
      _postingObstericHistoryData = false;
      notifyListeners();
    }
    return _obstetricHistory;
  }

  Future<Complication?> postComplication(
      Complication complication, int obstetricHistoryId) async {
    _postingComplicationData = true;

    notifyListeners();
    Complication? _complication;

    try {
      await motherServer
          .postComplication(
              complication: complication,
              obstetricHistoryId: obstetricHistoryId)
          .then((value) {
        _complication = value;

        _complicationList.add(value!);
      });
    } finally {
      _postingComplicationData = false;
      notifyListeners();
    }
    return _complication;
  }

  //clear data..
  clearComplications() {
    _complicationList.clear();
    notifyListeners();
  }

  Future<void> deleteComplication({required int id}) async {
    _deletingComplication = true;

    notifyListeners();

    try {
      await motherServer.deleteComplication(complicationId: id).then((value) {
        _complicationList.removeWhere((element) => element.id == id);
      });
    } finally {
      _deletingComplication = false;
      notifyListeners();
    }
  }
}
