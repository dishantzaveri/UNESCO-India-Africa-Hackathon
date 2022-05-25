 

import 'package:partograph/model/heart_rate.dart';

class HeartRateResponse {
 
  List<HeartRate> heartRates = [];

  HeartRateResponse.fromJson(Map<String, dynamic> json) {
    
    if (json['heartRates'] != null) {
      heartRates = <HeartRate>[];
      json['heartRates'].forEach((v) {
        heartRates.add(HeartRate.fromMap(v));
      });
    }
  }
}
