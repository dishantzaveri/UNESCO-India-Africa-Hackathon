import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:partograph/model/indicator.dart';

class UtilityProvider with ChangeNotifier {
  ///Constructor users
  UtilityProvider();
  List<Indicator> get indicatorList => _indicatorList;
  Country? _country = Country.tryParse("Tanzania");


//setters
  set selectCountry(Country country) {
    _country = country;
    notifyListeners();
  }
  
//getters
 Country? get selectedCountry => _country;
  selectIndicator(Indicator indicator) {
    for (var element in _indicatorList) {
      {
        element.isSelected = false;
      }
    }

    _indicatorList.firstWhere(((element) => element == indicator)).isSelected =
        true;
    notifyListeners();
  }

  ///snackbar
  void showInSnackBar(
      {required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey,
      required String title,
      required IconData icon,
      required Color color,
      required Color backgroundColor}) {
    final snackBar = SnackBar(
      content: ListTile(
        leading: Icon(
          icon,
          color: color,
        ),
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
      ),
      backgroundColor: backgroundColor,
      duration: const Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

List<Indicator> _indicatorList = <Indicator>[
  Indicator(
      icon: 'assets/icons/heart-attack.png',
      title: 'Fetal heart rate',
      isSelected: true),
  Indicator(icon: 'assets/icons/fetus.png', title: 'Amniotic fluid & Moulding'),
  Indicator(icon: 'assets/icons/pregnant.png', title: 'Labour Progress'),
  Indicator(icon: 'assets/icons/balloon.png', title: "Mother's condition"),
];
