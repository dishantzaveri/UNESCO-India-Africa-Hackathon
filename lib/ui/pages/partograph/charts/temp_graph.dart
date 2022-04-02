import 'package:flutter/material.dart';

class TempGraph extends StatelessWidget {
  const TempGraph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Temperature ℃"),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
          child: Row(
            children: _list
                .map((temp) => Expanded(
                    child: Container(
                      height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)),
                        child: Center(child: Text(temp)))))
                .toList(),
          ),
        ),
      ],
    );
  }
}

List<String> _list = ["", "36.8", "37", "", "37", "", "", "", "", "", "", ""];
