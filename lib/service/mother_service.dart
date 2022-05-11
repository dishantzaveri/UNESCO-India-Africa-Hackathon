 
import 'dart:convert';

import 'package:partograph/model/mother.dart';
import 'package:partograph/service/base/api_base_helper.dart';
import 'package:partograph/service/responses/mother_response.dart';

 

class MotherServer {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<List<Mother>> fetchMotherList() async {
    final response = await _helper.getData("mothers");
    return MotherResponse.fromJson(response).mothers;
  }

  Future<void> postMother({required Mother mother}) async {
    await _helper.postData(data: jsonEncode(mother.toMap()), url: "mothers");
  }
  //   Future<void> postMother({required Mother mother}) async {
  //   Map<String, String> _headers = {"Content-Type": "application/json"};
  //   try {
  //     Response result = await post(Uri.parse(gumbaServerAPI + "mothers"),
  //         body: jsonEncode(mother.toMap()), headers: _headers);
  //   } catch (e) {
  //     print(e);
  //   }
  // } 
  
}

MotherServer motherServer = MotherServer();
