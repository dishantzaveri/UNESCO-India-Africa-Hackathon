class HeartRate {
  String time;
  int id;
  double value;

  HeartRate({required this.time, required this.id, required this.value});

  Map<dynamic, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'time': time,
      'value': value,
    };

    return map;
  }

  factory HeartRate.fromMap(Map<String, dynamic> data) {
    return HeartRate(
      time: data["time"],
      id: data["id"],
      value: double.parse(data["value"].toString()),
    );
  }
}
