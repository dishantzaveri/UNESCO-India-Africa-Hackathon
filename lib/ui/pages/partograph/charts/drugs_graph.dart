import 'package:flutter/material.dart';
 
class DrugsGraph extends StatelessWidget {
  const DrugsGraph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Drugs Given & IV fluids"),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
          child: Row(
            children: _list
                .map((temp) => Expanded(
                    child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)),
                        child: Center(
                            child: RotationTransition(
                             turns: const AlwaysStoppedAnimation(15 / 360),
                                
                                child: SizedBox(
                               
                                  width: 800,
                                  height: 800,
                                  child: Text(temp)))))))
                .toList(),
          ),
        ),
      ],
    );
  }
}

List<String> _list = [" ", " ", " ", "", " ", "", "", "", "", "", "", ""];
