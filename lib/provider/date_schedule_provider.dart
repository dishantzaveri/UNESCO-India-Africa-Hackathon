import 'package:flutter/material.dart';
import 'package:partograph/model/date_schedule.dart';

class DateScheduleProvider with ChangeNotifier {
  final List<DateSchedule> _dateScheduleList = [
    DateSchedule(title: "1", subtitle: 'Fri', end: '2:00 AM', start: '01:00 PM'),
    DateSchedule(
        title: "2", subtitle: 'Sat', isSelected: true,end: '01:00 PM', start: '11:00 PM'),
    DateSchedule(
        title: "3", subtitle: 'Sun', end: '01:00 PM', start: '06:00 AM'),
    DateSchedule(
        title: "4", subtitle: 'Mon', end: '05:30 PM', start: '10:00 AM'),
    DateSchedule(
        title: "5", subtitle: 'Tue', end: '12:00 AM', start: '03:00 PM'),
    DateSchedule(
        title: "6", subtitle: 'Wed', end: '01:00 PM', start: '11:00 PM'),
    DateSchedule(
        title: "7", subtitle: 'Thus', end: '05:30 PM', start: '10:00 AM'),
  ];

  ///Constructor users
  DateScheduleProvider();
  List<DateSchedule> get dateScheduleList => _dateScheduleList;

  postDateSchedule(DateSchedule dateSchedule) async {
    _dateScheduleList.add(dateSchedule);
    notifyListeners();
  }

  selectDate(DateSchedule dateSchedule) {
    for (var element in _dateScheduleList) {
      {
        element.isSelected = false;
      }
    }

    _dateScheduleList
        .firstWhere(((element) => element == dateSchedule))
        .isSelected = true;
    notifyListeners();
  }
}
