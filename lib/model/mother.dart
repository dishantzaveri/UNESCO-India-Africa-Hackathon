import 'package:partograph/model/partogram_recording.dart';

class Mother {
  int id;
  String fullname;
  String gestationPeriod;
  DateTime admissionDate;
  DateTime membraneRaptureTime;
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
      required this.partogramRecording});

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

  factory Mother.fromMap(Map<String, dynamic> data) {
    return Mother(
      id: data["id"],
      fullname: data["fullname"],
      age: data["age"],
      gestationPeriod: data["gestationPeriod"],
      admissionDate: data["admissionDate"],
      history: data["history"],
      membraneRaptureTime: data["membraneRaptureTime"],
      parity: data["parity"],
      partogramRecording: (data['partogramRecording']
          .map<PartogramRecording>((i) => PartogramRecording.fromMap(i))
          .toList()),
    );
  }
}
