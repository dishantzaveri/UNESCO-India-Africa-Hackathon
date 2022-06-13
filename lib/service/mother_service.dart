import 'dart:convert';

import 'package:partograph/model/admission_informations.dart';
import 'package:partograph/model/mother.dart';
import 'package:partograph/model/obstetric_history.dart';
import 'package:partograph/service/base/api_base_helper.dart';
import 'package:partograph/service/responses/admin_info_response.dart';
import 'package:partograph/service/responses/mother_response.dart';
import 'package:partograph/service/responses/obstetric_history_response.dart';

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
  //   Future<void> postMother({required Mother mother}) async {
  //   Map<String, String> _headers = {"Content-Type": "application/json"};
  //   try {
  //     Response result = await post(Uri.parse(gumbaServerAPI + "mothers"),
  //         body: jsonEncode(mother.toMap()), headers: _headers);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

}

MotherServer motherServer = MotherServer();
