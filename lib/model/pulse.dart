 
class Pulse {
  String time;
  int id;
  int value;

  Pulse({required this.time, required this.id, required this.value});

  Map<dynamic, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'time': time,
      'value': value,
    };

    return map;
  }

  factory Pulse.fromMap(Map<String, dynamic> data) {
    return Pulse(
      time: data["time"],
      id: data["id"],
      value: data["value"],
    );
  }
}
