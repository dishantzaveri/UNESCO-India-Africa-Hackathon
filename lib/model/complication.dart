class Complication {
  int id;
  int year;
  String complications;
  String method;
  String alive;

  Complication({
    required this.id,
    required this.year,
    required this.complications,
    required this.method,
    required this.alive,
  });

  Map<dynamic, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'year': year,
      'complications': complications,
      'method': method,
      'alive': alive
    };

    return map;
  }

  factory Complication.fromMap(Map<String, dynamic> data) {
    return Complication(
      id: data["id"],
      year: data["year"],
      complications: data["complications"],
      method: data["method"],
      alive: data["alive"],
    );
  }
}

List<Complication> complicationsList = [];
