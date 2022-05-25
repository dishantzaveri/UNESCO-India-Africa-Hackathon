import 'package:flutter/material.dart';
import 'package:partograph/model/mother.dart';
import 'package:partograph/model/urine.dart';
import 'package:partograph/ui/pages/indicator/forms/urine_form.dart';
import 'package:partograph/ui/widgets/titled_header_button.dart';

class UrineCard extends StatelessWidget {
  const UrineCard({Key? key, required this.urine, required this.mother})
      : super(key: key);
  final List<Urine> urine;
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
                title: "Urine",
                onPressed: () {
                  urineShowDialogForm(context);
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
                  itemCount: urine.length,
                  itemBuilder: (_, index) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Expanded(child: Text('Volume')),
                            Expanded(
                                child: Text(
                              '${urine[index].volume}',
                              textAlign: TextAlign.end,
                            ))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Expanded(child: Text('Protein')),
                            Expanded(
                                child: Text(
                              urine[index].protein,
                              textAlign: TextAlign.end,
                            ))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Expanded(child: Text('Acetone')),
                            Expanded(
                                child: Text(
                              urine[index].acetone,
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
                              urine[index].time,
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

  urineShowDialogForm(context) {
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
                const Expanded(child: Text("Urine")),
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
            content: UrineForm(
              mother: mother,
            ),
          );
        });
  }
}
