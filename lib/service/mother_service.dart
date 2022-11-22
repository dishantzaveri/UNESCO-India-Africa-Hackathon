import 'dart:convert';

import 'package:mother_and_baby/model/admission_informations.dart';
import 'package:mother_and_baby/model/complication.dart';
import 'package:mother_and_baby/model/mother.dart';
import 'package:mother_and_baby/model/obstetric_history.dart';
import 'package:mother_and_baby/service/base/api_base_helper.dart';
import 'package:mother_and_baby/service/responses/admin_info_response.dart';
import 'package:mother_and_baby/service/responses/complication_response.dart';
import 'package:mother_and_baby/service/responses/message_response.dart';
import 'package:mother_and_baby/service/responses/mother_response.dart';
import 'package:mother_and_baby/service/responses/obstetric_history_response.dart';

class MotherServer {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<List<Mother>> fetchMotherList() async {
    final response = await _helper.getData("mothers");
    return MotherResponse.fromJson(response).mothers;
  }

  Future<void> postMother({required Mother mother}) async {
    await _helper.postData(data: jsonEncode(mother.toMap()), url: "mother");
  }

  Future<AdmissionInformation?> postAdmissionInformation(
      {required AdmissionInformation admissionInformation,
      required int motherId}) async {
    AdmissionInformation? _admissionInfo;
    try {
      final response = await _helper.postDataWithReturns(
          data: jsonEncode(admissionInformation.toMap()),
          url: "admissionInformation/" + motherId.toString());

      _admissionInfo =
          AdminInfoResponse.fromJson(response).admissionInformation;
    } finally {}

    return _admissionInfo;
  }

  Future<ObstetricHistory?> postObstetricHistory(
      {required ObstetricHistory obstetricHistory,
      required int admissionInformationId}) async {
    ObstetricHistory? _obstetricHistory;

    try {
      final response = await _helper.postDataWithReturns(
          data: jsonEncode(obstetricHistory.toMap()),
          url: "obstetricHistory/" + admissionInformationId.toString());

      _obstetricHistory =
          ObstetricHistoryResponse.fromJson(response).obstetricHistory;
    } finally {}

    return _obstetricHistory;
  }

  Future<Complication?> postComplication(
      {required Complication complication,
      required int obstetricHistoryId}) async {
    Complication? _complication;

    try {
      final response = await _helper.postDataWithReturns(
          data: jsonEncode(complication.toMap()),
          url: "complication/" + obstetricHistoryId.toString());

      _complication = ComplicationResponse.fromJson(response).complication;
    } finally {}

    return _complication;
  }

  Future<String> deleteComplication({required int complicationId}) async {
    String _message = "";
    try {
      final response =
          await _helper.deleteData("complication/" + complicationId.toString());

      _message = MessageResponse.fromJson(response).message;
    } catch (e) {
      _message = e.toString();
    } finally {}

    return _message;
  }
}

MotherServer motherServer = MotherServer();
