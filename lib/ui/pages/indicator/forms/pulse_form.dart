import 'package:flutter/material.dart';
import 'package:partograph/model/mother.dart';
import 'package:partograph/ui/widgets/custom_text.dart';
import 'package:partograph/ui/widgets/titled_header.dart';

class PulseForm extends StatefulWidget {
  const PulseForm({Key? key, required this.mother}) : super(key: key);
 final Mother mother;
  @override
  State<PulseForm> createState() => _PulseFormState();
}

class _PulseFormState extends State<PulseForm> {
  final _formKeyHR = GlobalKey<FormState>();

  final _pulseTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
       mainAxisSize: MainAxisSize.min,
      children: [
        const TitledHeader(
          title: "Pulse",
        ),
        Form(
          key: _formKeyHR,
          child: Column(
            children: [
              CustomTextfield(
                hitText: 'eg. 100',
                labelText: 'Fetal Heart Rate',
                siUnit: "(bpm)",
                focusNode: FocusNode(),
                textEditingController: _pulseTextEditingController,
                maxLines: 1,
                message: 'fetal heart rate is required',
                keyboardType: TextInputType.number,
                icon: Icons.favorite,
                iconColor: Colors.red,
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
                    if (_formKeyHR.currentState!.validate()) {
                      print("yes");
                    } else {
                      print("ERROR");
                    }
                  },
                  child: const Text(
                    "Save Pulse",
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
