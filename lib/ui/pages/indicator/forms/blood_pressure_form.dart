import 'package:flutter/material.dart';
import 'package:mother_and_baby/model/blood_pressure.dart';
import 'package:mother_and_baby/model/mother.dart';
import 'package:mother_and_baby/provider/mother_provider.dart';
import 'package:mother_and_baby/ui/widgets/text_fields/bp_text.dart';
import 'package:provider/provider.dart';

class BloodPressureForm extends StatefulWidget {
  const BloodPressureForm({Key? key, required this.mother}) : super(key: key);
  final Mother mother;
  @override
  State<BloodPressureForm> createState() => _BloodPressureFormState();
}

class _BloodPressureFormState extends State<BloodPressureForm> {
  final _formKeyBP = GlobalKey<FormState>();

  final _systolicTextEditingController = TextEditingController();

  final _diastolicTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _motherProvider = Provider.of<MotherProvider>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Form(
          key: _formKeyBP,
          child: Column(
            children: [
              BPTextfield(
                systolicFocusNode: FocusNode(),
                systolicTextEditingController: _systolicTextEditingController,
                diastolicFocusNode: FocusNode(),
                diastolicTextEditingController: _diastolicTextEditingController,
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
                    if (_formKeyBP.currentState!.validate()) {
                      _motherProvider.postBloodPressure(
                          BloodPressure(
                            time: TimeOfDay.now().toString(),
                            id: 0,
                            systolic:
                                int.parse(_systolicTextEditingController.text),
                            diastolic:
                                int.parse(_diastolicTextEditingController.text),
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
    );
  }
}
