import 'package:flutter/material.dart';
import 'package:mother_and_baby/model/character.dart';
import 'package:mother_and_baby/model/mother.dart';
import 'package:mother_and_baby/model/urine.dart';
import 'package:mother_and_baby/provider/mother_provider.dart';
import 'package:mother_and_baby/ui/widgets/text_fields/custom_text.dart';
import 'package:provider/provider.dart';

class UrineForm extends StatefulWidget {
  const UrineForm({Key? key, required this.mother}) : super(key: key);
  final Mother mother;
  @override
  State<UrineForm> createState() => _UrineFormState();
}

class _UrineFormState extends State<UrineForm> {
  final _urineTextEditingController = TextEditingController();

  final _formKeyUrine = GlobalKey<FormState>();

  Character? _proteins = urineList[0];

  Character? _acetone = urineList[0];

  @override
  Widget build(BuildContext context) {
    final _motherProvider = Provider.of<MotherProvider>(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Form(
            key: _formKeyUrine,
            child: Column(
              children: [
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Protein"),
                    )
                  ],
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: urineList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) => RadioListTile<Character>(
                    title: Text(urineList[index].title),
                    value: urineList[index],
                    groupValue: _proteins,
                    onChanged: (Character? value) {
                      setState(() {
                        _proteins = value;
                      });
                    },
                  ),
                ),
                const Divider(),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Acetone"),
                    )
                  ],
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: urineList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) => RadioListTile<Character>(
                    title: Text(urineList[index].title),
                    value: urineList[index],
                    groupValue: _acetone,
                    onChanged: (Character? value) {
                      setState(() {
                        _acetone = value;
                      });
                    },
                  ),
                ),
                const Divider(),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Volume"),
                    )
                  ],
                ),
                CustomTextfield(
                  hitText: 'eg. 36.4',
                  labelText: 'Urine',
                  siUnit: "mm",
                  focusNode: FocusNode(),
                  textEditingController: _urineTextEditingController,
                  maxLines: 1,
                  message: 'urine is required',
                  keyboardType: TextInputType.number,
                  icon: Icons.water,
                  iconColor: Colors.blue,
                ),
              ],
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
                      if (_formKeyUrine.currentState!.validate()) {
                        _motherProvider.postUrine(
                            Urine(
                              time: TimeOfDay.now().toString(),
                              id: 0,
                              volume: double.parse(
                                  _urineTextEditingController.text),
                              acetone: _acetone!.value,
                              protein: _proteins!.value,
                            ),
                            widget.mother);
                        Navigator.pop(context);
                      } else {}
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
      ),
    );
  }
}
