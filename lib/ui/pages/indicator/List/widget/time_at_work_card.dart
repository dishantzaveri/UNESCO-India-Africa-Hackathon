import 'package:flutter/material.dart';
import 'package:partograph/model/date_schedule.dart';

class TimeAtWorkCard extends StatelessWidget {
  const TimeAtWorkCard({Key? key, required this.dateSchedule})
      : super(key: key);
  final DateSchedule dateSchedule;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${dateSchedule.title}/3/2022",
            style: const TextStyle(color: Colors.white),
          ),
          Text(
            "FROM: ${dateSchedule.start}",
            style: const TextStyle(color: Colors.white),
          ),
          Text(
            "TO:  ${dateSchedule.end}",
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
      decoration: const BoxDecoration(
          color: Color.fromRGBO(248, 54, 119, 1),
          borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }
}
