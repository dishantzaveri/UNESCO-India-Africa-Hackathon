import 'package:flutter/material.dart';
import 'package:mother_and_baby/model/complication.dart';

class ComplicationCard extends StatelessWidget {
  final Complication complication;
  final Function() onTap;
  const ComplicationCard(
      {Key? key, required this.complication, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "YEAR:\t",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("${complication.year}")
                ],
              ),
              const Divider(),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "COMPLICATION:\t",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(child: Text(complication.complication))
                ],
              ),
              const Divider(),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "METHOD:\t",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(complication.method)
                ],
              ),
              const Divider(),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "ALIVE:\t",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(complication.alive)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton.icon(
                      icon: const Icon(Icons.delete),
                      onPressed: onTap,
                      label: const Text("DELETE"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
