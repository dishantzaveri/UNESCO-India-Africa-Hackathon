
class Oxytocin {
  String time;
  int id;
  int drops;
  double amount;

  Oxytocin(
      {required this.time,
      required this.id,
      required this.drops,
      required this.amount});

  Map<dynamic, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'time': time,
      'drops': drops,
      'amount':amount
    };

    return map;
  }

  factory Oxytocin.fromMap(Map<String, dynamic> data) {
    return Oxytocin(
      time: data["time"],
      id: data["id"],
      drops: data["drops"],
      amount:data["amount"]
    );
  }
}
