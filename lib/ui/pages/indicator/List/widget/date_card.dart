import 'package:flutter/material.dart';
import 'package:partograph/model/date_schedule.dart';

class DateCard extends StatelessWidget {
  const DateCard({Key? key, required this.dateSchedule, required this.onTap})
      : super(key: key);
  final DateSchedule dateSchedule;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              dateSchedule.title,
              style: TextStyle(
                  fontSize: 18,
                  color: dateSchedule.isSelected ? Colors.white : Colors.black),
            ),
            Text(
              dateSchedule.subtitle,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: dateSchedule.isSelected ? Colors.white : Colors.black),
            )
          ],
        ),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        height: 70,
        width: 50,
        decoration: BoxDecoration(
            color: dateSchedule.isSelected ? Colors.cyan : Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}
