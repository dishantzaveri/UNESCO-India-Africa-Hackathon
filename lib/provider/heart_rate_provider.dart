import 'package:flutter/material.dart';
import 'package:partograph/model/heart_rate.dart';

class HeartRateProvider with ChangeNotifier {
  final List<HeartRate> _heartRateList = [
    HeartRate(time: TimeOfDay.now(), id: 1, value: 100),
    HeartRate(time: TimeOfDay.now(), id: 2, value: 120)
  ];

  ///Constructor users
  HeartRateProvider();
  List<HeartRate> get heartRateList => _heartRateList;

  postHeartRate(HeartRate heartRate) async {
    _heartRateList.add(heartRate);
    notifyListeners();
  }
}
