import 'package:flutter/material.dart';
import 'package:mother_and_baby/model/mother.dart';
import 'package:mother_and_baby/provider/mother_provider.dart';
import 'package:mother_and_baby/ui/pages/indicator/forms/fetal_heart_rate_form.dart';
import 'package:mother_and_baby/ui/widgets/titled_header_button.dart';
import 'package:provider/provider.dart';

class FetalHeartRateList extends StatelessWidget {
  const FetalHeartRateList({Key? key, required this.mother}) : super(key: key);
  final Mother mother;
  @override
  Widget build(BuildContext context) {
    final _motherProvider = Provider.of<MotherProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TitledHeaderButton(
                title: "Fetal Heart Rate",
                onPressed: () {
                  showDialogForm(context);
                },
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                        child: Row(
                      children: const [
                        Text(
                          'Value  (bpm)',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      ],
                    )),
                    Expanded(
                        child: Row(
                      children: const [
                        Spacer(),
                        Text(
                          'Time',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                          textAlign: TextAlign.end,
                        ),
                        Icon(
                          Icons.lock_clock,
                          color: Colors.green,
                        )
                      ],
                    ))
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _motherProvider.motherList
                      .firstWhere((element) => element == mother)
                      .admissionInformations
                      .last
                      .partograph!
                      .heartRate
                      .length,
                  itemBuilder: (_, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                            child: Text(
                                '${_motherProvider.motherList.firstWhere((element) => element == mother).admissionInformations.last.partograph!.heartRate[index].value} ')),
                        Expanded(
                            child: Text(
                          _motherProvider.motherList
                              .firstWhere((element) => element == mother)
                              .admissionInformations
                              .last
                              .partograph!
                              .heartRate[index]
                              .time,
                          textAlign: TextAlign.end,
                        ))
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

  showDialogForm(context) {
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
                const Expanded(child: Text("Fetal Heart Rate")),
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
            content: FetalHeartRateForm(
              mother: mother,
            ),
          );
        });
  }
}
