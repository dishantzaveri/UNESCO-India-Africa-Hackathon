 
class AmnioticFluid {
  String time;
  int id;
  String value;

  AmnioticFluid({required this.time, required this.id, required this.value});

  Map<dynamic, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'time': time,
      'value': value,
    };

    return map;
  }

  factory AmnioticFluid.fromMap(Map<String, dynamic> data) {
    return AmnioticFluid(
      time: data["time"],
      id: data["id"],
      value: data["value"],
    );
  }
}
