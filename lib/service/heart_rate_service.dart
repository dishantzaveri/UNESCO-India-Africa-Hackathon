 
import 'dart:convert';

 
import 'package:partograph/model/heart_rate.dart';
import 'package:partograph/service/base/api_base_helper.dart';
import 'package:partograph/service/responses/heart_rate_response.dart'; 

 

class HeartRateServer {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<List<HeartRate>> fetchHeartRateList() async {
    final response = await _helper.getData("heartRates");
    return HeartRateResponse.fromJson(response).heartRates;
  }

  Future<void> postHeartRate({required HeartRate heartRate, required int partographId}) async {
    await _helper.postData(data: jsonEncode(heartRate.toMap()), url: "heartRate/$partographId");
  }
  //   Future<void> postHeartRate({required HeartRate heartRate}) async {
  //   Map<String, String> _headers = {"Content-Type": "application/json"};
  //   try {
  //     Response result = await post(Uri.parse(gumbaServerAPI + "heartRates"),
  //         body: jsonEncode(heartRate.toMap()), headers: _headers);
  //   } catch (e) {
  //     print(e);
  //   }
  // } 
  
}

HeartRateServer heartRateServer = HeartRateServer();
