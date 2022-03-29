import 'package:flutter/material.dart';
import 'package:partograph/model/indicator.dart';

class UtilityProvider with ChangeNotifier {
  ///Constructor users
  UtilityProvider();
  List<Indicator> get indicatorList => _indicatorList;

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
