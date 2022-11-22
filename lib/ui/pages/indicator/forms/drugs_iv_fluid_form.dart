import 'package:flutter/material.dart';
import 'package:mother_and_baby/model/drug_iv_fluids.dart';
import 'package:mother_and_baby/model/mother.dart';
import 'package:mother_and_baby/provider/mother_provider.dart';
import 'package:mother_and_baby/ui/widgets/text_fields/custom_text.dart';
import 'package:provider/provider.dart';

class DrugsIvFluidForm extends StatefulWidget {
  const DrugsIvFluidForm({Key? key, required this.mother}) : super(key: key);
  final Mother mother;
  @override
  State<DrugsIvFluidForm> createState() => _DrugsIvFluidFormState();
}

class _DrugsIvFluidFormState extends State<DrugsIvFluidForm> {
  final _descriptionTextEditingController = TextEditingController();

  final _formKeyOxytocin = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _motherProvider = Provider.of<MotherProvider>(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Form(
            key: _formKeyOxytocin,
            child: Column(
              children: [
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Description"),
                    )
                  ],
                ),
                CustomTextfield(
                  hitText: 'Write...',
                  labelText: 'Description',
                  focusNode: FocusNode(),
                  textEditingController: _descriptionTextEditingController,
                  maxLines: 1,
                  message: 'Description is required',
                  keyboardType: TextInputType.text,
                  icon: Icons.local_hospital,
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
                      if (_formKeyOxytocin.currentState!.validate()) {
                        _motherProvider.postDrugIvFluids(
                            DrugIvFluid(
                              time: TimeOfDay.now().toString(),
                              id: 0,
                              value: _descriptionTextEditingController.text,
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
