 
class MouldingFetal {
  String time;
  int id;
  String value;

  MouldingFetal({required this.time, required this.id, required this.value});

  Map<dynamic, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'time': time,
      'value': value,
    };

    return map;
  }

  factory MouldingFetal.fromMap(Map<String, dynamic> data) {
    return MouldingFetal(
      time: data["time"],
      id: data["id"],
      value: data["value"],
    );
  }
}
