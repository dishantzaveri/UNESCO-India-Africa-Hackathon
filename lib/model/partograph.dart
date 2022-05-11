import 'package:flutter/material.dart';
import 'package:partograph/model/amniotic_fluid.dart';
import 'package:partograph/model/blood_pressure.dart';
import 'package:partograph/model/descent.dart';
import 'package:partograph/model/dilatation.dart';
import 'package:partograph/model/drug_iv_fluids.dart';
import 'package:partograph/model/heart_rate.dart';
import 'package:partograph/model/moulding_fetal.dart';
import 'package:partograph/model/oxytocin.dart';
import 'package:partograph/model/pulse.dart';
import 'package:partograph/model/temperature.dart';
import 'package:partograph/model/urine.dart';
import 'package:partograph/model/uterine_contractions.dart';

class Partograph {
  int id;
  String healthFacility;
  String namePatient;
  String gravidaPara;
  String status;
  DateTime date;
  TimeOfDay startsAt;
  TimeOfDay endsAt;
  int admissionInformationId;
  List<AmnioticFluid> amnioticFluid;
  List<HeartRate> heartRate;
  List<MouldingFetal> mouldingFetal;
  List<Dilatation> dilatation;
  List<Descent> descent;
  List<BloodPressure> bloodPressure;
  List<DrugIvFluid> drugIvFluid;
  List<Urine> urine;
  List<UterineContraction> uterineContractions;
  List<Temperature> temperature;
  List<Pulse> pulse;
  List<Oxytocin> oxytocin;

  Partograph(
      {required this.id,
      required this.healthFacility,
      required this.namePatient,
      required this.gravidaPara,
      required this.status,
      required this.date,
      required this.startsAt,
      required this.endsAt,
      required this.admissionInformationId,
      required this.amnioticFluid,
      required this.heartRate,
      required this.mouldingFetal,
      required this.descent,
      required this.dilatation,
      required this.bloodPressure,
      required this.drugIvFluid,
      required this.urine,
      required this.uterineContractions,
      required this.temperature,
      required this.pulse,
      required this.oxytocin});

  Map<dynamic, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'health_facility': healthFacility,
      'name_patient': namePatient,
      'gravida_para': gravidaPara,
      'status': status,
      'date': date,
      'starts_at': startsAt,
      'ends_at': endsAt,
      'admission_information_id': admissionInformationId,
      'amnioticFluid': amnioticFluid.map((e) => e.toMap()).toList(),
      'heartRate': heartRate.map((e) => e.toMap()).toList(),
      'mouldingFetal': mouldingFetal.map((e) => e.toMap()).toList(),
      'descent': descent.map((e) => e.toMap()).toList(),
      'dilatation': dilatation.map((e) => e.toMap()).toList(),
      'bloodPressure': bloodPressure.map((e) => e.toMap()).toList(),
      'drugIvFluid': drugIvFluid.map((e) => e.toMap()).toList(),
      'urine': urine.map((e) => e.toMap()).toList(),
      'uterineContractions': uterineContractions.map((e) => e.toMap()).toList(),
      'temperature': temperature.map((e) => e.toMap()).toList(),
      'pulse': pulse.map((e) => e.toMap()).toList(),
      'oxytocin': oxytocin.map((e) => e.toMap()).toList(),
    };

    return map;
  }

  factory Partograph.fromMap(Map<String, dynamic> data) {
    return Partograph(
      id: data["id"],
      healthFacility: data['health_facility'],
      namePatient: data['name_patient'],
      gravidaPara: data['gravida_para'],
      status: data['status'],
      date: DateTime.parse(data['date']),
      startsAt: TimeOfDay.fromDateTime(DateTime.parse(data['starts_at'])),
      endsAt: TimeOfDay.fromDateTime(DateTime.parse(data['ends_at'])),
      admissionInformationId: data['admission_information_id'],
      amnioticFluid: (data['amnioticFluid']
          .map<AmnioticFluid>((i) => AmnioticFluid.fromMap(i))
          .toList()),
      heartRate: (data['heartRate']
          .map<HeartRate>((i) => HeartRate.fromMap(i))
          .toList()),
      mouldingFetal: (data['mouldingFetal']
          .map<MouldingFetal>((i) => MouldingFetal.fromMap(i))
          .toList()),
      dilatation: (data['dilatation']
          .map<Dilatation>((i) => Dilatation.fromMap(i))
          .toList()),
      descent:
          (data['descent'].map<Descent>((i) => Descent.fromMap(i)).toList()),
      bloodPressure: (data['bloodPressure']
          .map<BloodPressure>((i) => BloodPressure.fromMap(i))
          .toList()),
      drugIvFluid: (data['drugIvFluid']
          .map<DrugIvFluid>((i) => DrugIvFluid.fromMap(i))
          .toList()),
      urine: (data['urine'].map<Urine>((i) => Urine.fromMap(i)).toList()),
      temperature: (data['temperature']
          .map<Temperature>((i) => Temperature.fromMap(i))
          .toList()),
      pulse: (data['pulse'].map<Pulse>((i) => Pulse.fromMap(i)).toList()),
      oxytocin:
          (data['oxytocin'].map<Oxytocin>((i) => Oxytocin.fromMap(i)).toList()),
      uterineContractions: (data['uterineContractions']
          .map<UterineContraction>((i) => UterineContraction.fromMap(i))
          .toList()),
    );
  }
}
