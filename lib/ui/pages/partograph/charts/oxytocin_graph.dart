import 'package:flutter/material.dart';
import 'package:mother_and_baby/model/urine.dart';

class OxytocinGraph extends StatelessWidget {
  const OxytocinGraph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Amniotic fluid & moulding"),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
          child: Row(
            children: _list
                .map((list) => Expanded(
                        child: Column(
                      children: [
                        Container(
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: Center(child: Text(list.protein))),
                        Container(
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: Center(child: Text(list.acetone))),
                      ],
                    )))
                .toList(),
          ),
        ),
      ],
    );
  }
}

List<Urine> _list = [
  // Urine(time: TimeOfDay.now(), id: 1, protein: '', acetone: '', volume: 0),
  // Urine(time: TimeOfDay.now(), id: 2, protein: " ", acetone: ' ', volume: 200),
  // Urine(time: TimeOfDay.now(), id: 3, protein: ' ', acetone: '', volume: 0),
  // Urine(time: TimeOfDay.now(), id: 4, protein: ' ', acetone: '', volume: 0),
  // Urine(time: TimeOfDay.now(), id: 5, protein: ' ', acetone: ' ', volume: 150),
  // Urine(time: TimeOfDay.now(), id: 6, protein: ' ', acetone: '', volume: 0),
  // Urine(time: TimeOfDay.now(), id: 7, protein: '', acetone: '', volume: 0),
  // Urine(time: TimeOfDay.now(), id: 8, protein: '', acetone: '', volume: 0),
  // Urine(time: TimeOfDay.now(), id: 9, protein: '', acetone: '', volume: 0),
  // Urine(time: TimeOfDay.now(), id: 10, protein: '', acetone: '', volume: 0),
  // Urine(time: TimeOfDay.now(), id: 11, protein: '', acetone: '', volume: 0),
  // Urine(time: TimeOfDay.now(), id: 12, protein: '', acetone: '', volume: 0)
];
