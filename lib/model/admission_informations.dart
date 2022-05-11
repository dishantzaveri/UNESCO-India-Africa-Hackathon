import 'package:flutter/material.dart';
import 'package:partograph/model/partograph.dart';

class AdmissionInformation {
  TimeOfDay time;
  int id;
  String nameOfHealthFacility;
  String hospitalRegNo;
  DateTime dateOfAdmission;

  String admittingNurseDoctorName;
  String reasonForReferralOrManagementReceived;
  String dangerSignsAndRiskFactors;
  Partograph partograph;

  AdmissionInformation(
      {required this.id,
      required this.time,
      required this.nameOfHealthFacility,
      required this.hospitalRegNo,
      required this.dateOfAdmission,
      required this.admittingNurseDoctorName,
      required this.reasonForReferralOrManagementReceived,
      required this.dangerSignsAndRiskFactors,
      required this.partograph});

  Map<dynamic, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'time': time,
      'name_of_health_facility': nameOfHealthFacility,
      'hospital_reg_no': hospitalRegNo,
      'date_of_admission': dateOfAdmission,
      'admitting_nurse_doctor_name': admittingNurseDoctorName,
      'reason_for_referral_or_management_received':
          reasonForReferralOrManagementReceived,
      'danger_signs_and_risk_factors': dangerSignsAndRiskFactors,
      'partographs': partograph.toMap()
    };

    return map;
  }

  factory AdmissionInformation.fromMap(Map<String, dynamic> data) {
    return AdmissionInformation(
      id: data["id"],
      time: data["time"],
      nameOfHealthFacility: data["name_of_health_facility"],
      hospitalRegNo: data["hospital_reg_no"],
      dateOfAdmission: data["date_of_admission"],
      admittingNurseDoctorName: data["admitting_nurse_doctor_name"],
      reasonForReferralOrManagementReceived:
          data["reason_for_referral_or_management_received"],
      dangerSignsAndRiskFactors: data["danger_signs_and_risk_factors"],
      partograph: Partograph.fromMap(data['partograph']),
    );
  }
}
