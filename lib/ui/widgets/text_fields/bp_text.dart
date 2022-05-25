import 'package:flutter/material.dart';

class BPTextfield extends StatelessWidget {
  final double extraPadding;

  final FocusNode systolicFocusNode;
  final FocusNode diastolicFocusNode;

  final TextEditingController systolicTextEditingController;
  final TextEditingController diastolicTextEditingController;

  const BPTextfield({
    Key? key,
    required this.systolicFocusNode,
    required this.diastolicFocusNode,
    required this.systolicTextEditingController,
    required this.diastolicTextEditingController,
    this.extraPadding = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Material(
        elevation: 2.0,
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        child: Padding(
          padding: EdgeInsets.all(extraPadding),
          child: Row(
            children: <Widget>[
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  focusNode: systolicFocusNode,
                  controller: systolicTextEditingController,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    hintText: "eg. 80",
                    labelText: "Systolic",
                    icon: Icon(
                      Icons.medical_services,
                      color: Colors.green,
                    ),
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "pressure required";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              const Text("/\t\t\t\t"),
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  focusNode: diastolicFocusNode,
                  controller: diastolicTextEditingController,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    hintText: "eg. 72",
                    labelText: "Diastolic",
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Diastolic pressure required";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              const Text("mm/Hg"),
              const SizedBox(
                width: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
