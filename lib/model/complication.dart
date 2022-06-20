class Complication {
  int id;
  int year;
  String complication;
  String method;
  String alive;

  Complication({
    required this.id,
    required this.year,
    required this.complication,
    required this.method,
    required this.alive,
  });

  Map<dynamic, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'year': year,
      'complication': complication,
      'method': method,
      'alive': alive
    };

    return map;
  }

  factory Complication.fromMap(Map<String, dynamic> data) {
    return Complication(
      id: data["id"],
      year: data["year"],
      complication: data["complication"],
      method: data["method"],
      alive: data["alive"],
    );
  }
}

 