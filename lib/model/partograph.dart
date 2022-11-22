import 'package:mother_and_baby/model/amniotic_fluid.dart';
import 'package:mother_and_baby/model/blood_pressure.dart';
import 'package:mother_and_baby/model/descent.dart';
import 'package:mother_and_baby/model/dilatation.dart';
import 'package:mother_and_baby/model/drug_iv_fluids.dart';
import 'package:mother_and_baby/model/heart_rate.dart';
import 'package:mother_and_baby/model/moulding_fetal.dart';
import 'package:mother_and_baby/model/oxytocin.dart';
import 'package:mother_and_baby/model/pulse.dart';
import 'package:mother_and_baby/model/temperature.dart';
import 'package:mother_and_baby/model/urine.dart';
import 'package:mother_and_baby/model/uterine_contractions.dart';

class Partograph {
  int id;
  String healthFacility;
  String namePatient;
  String gravidaPara;
  String status;
  String date;
  String startsAt;
  String endsAt;
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
      date: data['date'],
      startsAt: data['starts_at'],
      endsAt: data['ends_at'],
      admissionInformationId: data['admission_information_id'],
      amnioticFluid: (data['amniotic_fluids']
          .map<AmnioticFluid>((i) => AmnioticFluid.fromMap(i))
          .toList()),
      heartRate: (data['heart_rates']
          .map<HeartRate>((i) => HeartRate.fromMap(i))
          .toList()),
      mouldingFetal: (data['moulding_fetals']
          .map<MouldingFetal>((i) => MouldingFetal.fromMap(i))
          .toList()),
      dilatation: (data['dilatations']
          .map<Dilatation>((i) => Dilatation.fromMap(i))
          .toList()),
      descent:
          (data['descents'].map<Descent>((i) => Descent.fromMap(i)).toList()),
      bloodPressure: (data['blood_pressures']
          .map<BloodPressure>((i) => BloodPressure.fromMap(i))
          .toList()),
      drugIvFluid: (data['drug_iv_fluids']
          .map<DrugIvFluid>((i) => DrugIvFluid.fromMap(i))
          .toList()),
      urine: (data['urines'].map<Urine>((i) => Urine.fromMap(i)).toList()),
      temperature: (data['temperatures']
          .map<Temperature>((i) => Temperature.fromMap(i))
          .toList()),
      pulse: (data['pulses'].map<Pulse>((i) => Pulse.fromMap(i)).toList()),
      oxytocin: (data['oxytocins']
          .map<Oxytocin>((i) => Oxytocin.fromMap(i))
          .toList()),
      uterineContractions: (data['uterine_contractions']
          .map<UterineContraction>((i) => UterineContraction.fromMap(i))
          .toList()),
    );
  }
}
