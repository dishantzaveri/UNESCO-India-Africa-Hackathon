import 'package:flutter/material.dart';
import 'package:mother_and_baby/model/mother.dart';
import 'package:mother_and_baby/model/oxytocin.dart';
import 'package:mother_and_baby/ui/pages/indicator/forms/oxytocin_form.dart';
import 'package:mother_and_baby/ui/widgets/titled_header_button.dart';

class OxytocinCard extends StatelessWidget {
  const OxytocinCard({Key? key, required this.oxytocin, required this.mother})
      : super(key: key);
  final List<Oxytocin> oxytocin;
  final Mother mother;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TitledHeaderButton(
                title: "Oxytocin",
                onPressed: () {
                  oxytocinShowDialogForm(context);
                },
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: oxytocin.length,
                  itemBuilder: (_, index) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Expanded(child: Text('Amount')),
                            Expanded(
                                child: Text(
                              '${oxytocin[index].amount}',
                              textAlign: TextAlign.end,
                            ))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Expanded(child: Text('Drops/min')),
                            Expanded(
                                child: Text(
                              '${oxytocin[index].drops}',
                              textAlign: TextAlign.end,
                            ))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Expanded(child: Text('Time')),
                            Expanded(
                                child: Text(
                              oxytocin[index].time,
                              textAlign: TextAlign.end,
                            ))
                          ],
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  oxytocinShowDialogForm(context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(child: Text("Oxytocin")),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16))),
            content: OxytocinForm(
              mother: mother,
            ),
          );
        });
  }
}
