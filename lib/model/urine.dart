import 'package:flutter/material.dart';

class Urine {
  TimeOfDay time;
  int id;
  String protein;
  String acetone;
  double volume;

  Urine(
      {required this.time,
      required this.id,
      required this.protein,
      required this.acetone,
      required this.volume});

  Map<dynamic, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'time': time,
      'protein': protein,
      'acetone': acetone,
      'volume':volume
    };

    return map;
  }

  factory Urine.fromMap(Map<String, dynamic> data) {
    return Urine(
      time: data["time"],
      id: data["id"],
      protein: data["protein"],
      acetone: data["acetone"],
      volume:data["volume"]
    );
  }
}
