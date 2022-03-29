import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String hitText;
  final String labelText;
  final int maxLines;
  final IconData icon;
  final String message;
  final String siUnit;
  final TextInputType keyboardType;
  final Color iconColor;
  final double extraPadding;

  final FocusNode focusNode;

  final TextEditingController textEditingController;

  const CustomTextfield({
    Key? key,
    required this.hitText,
    required this.labelText,
    required this.focusNode,
    required this.textEditingController,
    required this.maxLines,
    required this.message,
    required this.keyboardType,
    this.extraPadding = 0.0,
    required this.icon,
    this.siUnit = "",
    required this.iconColor,
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
                  keyboardType: keyboardType,
                  focusNode: focusNode,
                  controller: textEditingController,
                  maxLines: maxLines,
                  decoration: InputDecoration(
                    hintText: hitText,
                    labelText: labelText,
                    icon: Icon(
                      icon,
                      color: iconColor,
                    ),
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return message;
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Text(siUnit),
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
