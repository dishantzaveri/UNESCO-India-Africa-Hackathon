import 'package:flutter/material.dart';
import 'package:partograph/model/character.dart';
import 'package:partograph/model/mother.dart';
import 'package:partograph/ui/widgets/custom_text.dart';
import 'package:partograph/ui/widgets/titled_header.dart';

class UrineForm extends StatefulWidget {
  const UrineForm({Key? key,required this.mother}) : super(key: key);
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
    return Column(
       mainAxisSize: MainAxisSize.min,
      children: [
        
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
