import 'package:partograph/constants/enum.dart';
import 'package:partograph/model/partogram_recording.dart';

class Mother {
  int id;
  String fullname;
  String gestationPeriod;
  DateTime admissionDate;
  DateTime membraneRaptureTime;
  CaseCategory caseCategory;
  String history;
  int age;
  int parity;
  List<PartogramRecording> partogramRecording;

  Mother(
      {required this.id,
      required this.gestationPeriod,
      required this.admissionDate,
      required this.fullname,
      required this.parity,
      required this.age,
      required this.history,
      required this.membraneRaptureTime,
      required this.partogramRecording,
      required this.caseCategory});

  Map<dynamic, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'gestationPeriod': gestationPeriod,
      'admissionDate': admissionDate,
      'fullname': fullname,
      'parity': parity,
      'age': age,
      'history': history,
      'membraneRaptureTime': membraneRaptureTime,
      'partogramRecording': partogramRecording.map((e) => e.toMap())
    };

    return map;
  }
}
