import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:mother_and_baby/model/user.dart';
import 'package:mother_and_baby/service/auth_service.dart';
import 'package:mother_and_baby/shared/shared_preference.dart';
import 'package:rxdart/rxdart.dart';

class AuthProvider with ChangeNotifier {
  ///Constructor users
  AuthProvider();
  final PublishSubject<bool> _userSubject = PublishSubject<bool>();

  /// Shared preference DB
  final SharedPref _sharedPref = SharedPref();

  ///authenicated user
  User? _authenicatedUser;
  bool _isAuthenticated = false;
  bool _isLoadingData = false;
  bool _isSendingAuthData = false;
  bool _isLoginForm = true;
  Country? _country = Country.tryParse("Tanzania");
  String _selectedGender = "MALE";
  String _errorMessade = "";

  ///getters
  bool get isAuthenticated => _isAuthenticated;
  User? get authenicatedUser => _authenicatedUser;
  bool get isSendingAuthData => _isSendingAuthData;
  bool get isLoadingData => _isLoadingData;
  bool get isLoginForm => _isLoginForm;
  String get selectedGender => _selectedGender;
  String get errorMessage => _errorMessade;

  PublishSubject<bool> get userSubject {
    return _userSubject;
  }

  Country? get selectedCountry => _country;
  //operations...

  ///sign
  ///Edit User
  Future<void> editUser({
    required String name,
    required String email,
    required String mobile,
    required String avatar,
  }) async {
    // final _user = User(
    //   email: email,
    //   phone: mobile,
    //   name: name,
    //   avatar: avatar,
    //   id: 1,
    // );
  }

//login user
  Future<bool> authenticateUser(
      {required User user, required String url}) async {
    _isSendingAuthData = true;
    notifyListeners();

    bool _success = false;

    try {
      _authenicatedUser =
          await userServer.authenticateUser(user: user, url: url);
      _sharedPref.save('user', _authenicatedUser!.toMap());
      _success = true;
    } catch (e) {
      _errorMessade = e.toString();
      _success = false;
    } finally {
      _isSendingAuthData = false;
      notifyListeners();
    }

    return _success;
  }

//reset password
  Future<void> resetPassword({required String mobile}) async {}

//reset password
  Future<void> createNewPassword(
      {required String mobile,
      required String code,
      required password}) async {}

  ///logout user
  Future<void> logout() async {
    _userSubject.add(false);
    _sharedPref.remove('user');
    _isAuthenticated = false;
    _isLoginForm = true;
    notifyListeners();
  }

  ///log off user
  Future<void> logOff() async {
    _userSubject.add(false);
    notifyListeners();
  }

  ///auto authenicate
  Future<void> autoAuthenticate() async {
    _isLoadingData = true;
    notifyListeners();

    try {
      User _user = User.fromMap(await _sharedPref.read("user"));
      _authenicatedUser = _user;
      _isAuthenticated = true;
      _userSubject.add(true);
    } catch (e) {
      _isAuthenticated = false;
      _userSubject.add(false);
    }

    _isLoadingData = false;
    notifyListeners();
  }

  set toggleLoginForm(bool value) {
    _isLoginForm = value;
    notifyListeners();
  }

  set selectCountry(Country country) {
    _country = country;
    notifyListeners();
  }

  set selectGender(String gender) {
    _selectedGender = gender;
    notifyListeners();
  }
}
