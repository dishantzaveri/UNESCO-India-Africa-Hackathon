import 'package:flutter/material.dart';
import 'package:partograph/model/mother.dart';
import 'package:partograph/ui/widgets/bp_text.dart';
import 'package:partograph/ui/widgets/titled_header.dart';

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
    return Column(
       mainAxisSize: MainAxisSize.min,
      children: [
        const TitledHeader(
          title: "Blood Pressure",
        ),
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
                    print("dù");
                    if (_formKeyBP.currentState!.validate()) {
                      print("yes");
                    } else {
                      print("ERROR");
                    }
                  },
                  child: const Text(
                    "Save Blood Pressure",
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
