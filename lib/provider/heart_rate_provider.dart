import 'package:flutter/material.dart';
import 'package:mother_and_baby/model/heart_rate.dart';

class HeartRateProvider with ChangeNotifier {
  final List<HeartRate> _heartRateList = [];

  ///Constructor users
  HeartRateProvider();
  List<HeartRate> get heartRateList => _heartRateList;

  postHeartRate(HeartRate heartRate) async {
    _heartRateList.add(heartRate);
    notifyListeners();
  }
}
