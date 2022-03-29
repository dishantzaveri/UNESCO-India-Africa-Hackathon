import 'dart:convert';

import 'package:partograph/model/user.dart';
import 'package:partograph/service/base/api_base_helper.dart';

class UserServer {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<User?> authenticateUser(
      {required User user, required String url}) async {
    final response = await _helper.postDataWithReturns(
        data: jsonEncode(user.toMap()), url: url); 
    return User.fromMap(response["data"]);
  }
}

UserServer userServer = UserServer();
