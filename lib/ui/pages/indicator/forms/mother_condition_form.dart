import 'package:flutter/material.dart';
import 'package:partograph/model/character.dart';
import 'package:partograph/ui/widgets/bp_text.dart';
import 'package:partograph/ui/widgets/custom_text.dart';
import 'package:partograph/ui/widgets/titled_header.dart';

class MotherConditionForm extends StatefulWidget {
  const MotherConditionForm({Key? key}) : super(key: key);

  @override
  State<MotherConditionForm> createState() => _MotherConditionFormState();
}

class _MotherConditionFormState extends State<MotherConditionForm> {
  final _formKeyHR = GlobalKey<FormState>();

  final _formKeyBP = GlobalKey<FormState>();

  final _pulseTextEditingController = TextEditingController();

  final _formKeyTemp = GlobalKey<FormState>();

  final _tempTextEditingController = TextEditingController();

  final _systolicTextEditingController = TextEditingController();

  final _diastolicTextEditingController = TextEditingController();

  final _urineTextEditingController = TextEditingController();

  final _formKeyUrine = GlobalKey<FormState>();

  Character? _proteins = urineList[0];

  Character? _acetone = urineList[0];

  @override
  Widget build(BuildContext context) {
    return Column(
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
        const Divider(),
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
        const Divider(),
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
        const Divider(),
        const TitledHeader(
          title: "Urine",
        ),
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
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Urine Volume"),
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
                    print("dù");
                    if (_formKeyUrine.currentState!.validate()) {
                      print("yes");
                    } else {
                      print("ERROR");
                    }
                  },
                  child: const Text(
                    "Save Urine",
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
