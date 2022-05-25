 
class Descent {
  String time;
  int id;
  int value;

  Descent({required this.time, required this.id, required this.value});

  Map<dynamic, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'time': time,
      'value': value,
    };

    return map;
  }

  factory Descent.fromMap(Map<String, dynamic> data) {
    return Descent(
      time: data["time"],
      id: data["id"],
      value: data["value"],
    );
  }
}
