import 'package:flutter/material.dart';
import 'package:partograph/model/mother.dart';
import 'package:partograph/ui/widgets/custom_text.dart';
import 'package:partograph/ui/widgets/titled_header.dart';

class TemperatureForm extends StatefulWidget {
  const TemperatureForm({Key? key, required this.mother}) : super(key: key);
  final Mother mother;

  @override
  State<TemperatureForm> createState() => _TemperatureFormState();
}

class _TemperatureFormState extends State<TemperatureForm> {
  final _formKeyTemp = GlobalKey<FormState>();

  final _tempTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const TitledHeader(
          title: "Temperature",
        ),
        Form(
          key: _formKeyTemp,
          child: Column(
            children: [
              CustomTextfield(
                hitText: 'eg. 36.4',
                labelText: 'Temperature',
                siUnit: "℃",
                focusNode: FocusNode(),
                textEditingController: _tempTextEditingController,
                maxLines: 1,
                message: 'temperature is required',
                keyboardType: TextInputType.number,
                icon: Icons.thermostat,
                iconColor: Colors.cyan,
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
                    if (_formKeyTemp.currentState!.validate()) {
                      print("yes");
                    } else {
                      print("ERROR");
                    }
                  },
                  child: const Text(
                    "Save Temperature",
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
