import 'package:flutter/material.dart';
import 'package:partograph/model/character.dart';
import 'package:partograph/model/mother.dart';
import 'package:partograph/model/moulding_fetal.dart';
import 'package:partograph/provider/mother_provider.dart';
import 'package:partograph/ui/widgets/titled_header.dart';
import 'package:provider/provider.dart';

class ModulingForm extends StatefulWidget {
  const ModulingForm({Key? key, required this.mother}) : super(key: key);
  final Mother mother;
  @override
  State<ModulingForm> createState() => _ModulingFormState();
}

class _ModulingFormState extends State<ModulingForm> {
  Character? _moulding = moudlingList[0];

  @override
  Widget build(BuildContext context) {
    final _motherProvider = Provider.of<MotherProvider>(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: moudlingList.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, index) => RadioListTile<Character>(
            title: Text(moudlingList[index].title),
            value: moudlingList[index],
            groupValue: _moulding,
            onChanged: (Character? value) {
              setState(() {
                _moulding = value;
              });
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60.0),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    _motherProvider.postMoulding(
                        MouldingFetal(
                          time: TimeOfDay.now(),
                          id: 0,
                          value: _moulding!.value,
                        ),
                        widget.mother);
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
