import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

typedef TimeTextfieldOnChange = Function(String);

class TimeTextfield extends StatelessWidget {
  final String hitText;
  final String labelText;
  final int maxLines;
  final String message;
  final String? prefix;
  final String? surfix;
  final IconData? prefixIcon;
  final TextInputType keyboardType;
  final TimeTextfieldOnChange? onChange;
  final GlobalKey<FormFieldState>? formFieldKey;
  final double extraPadding;

  final FocusNode focusNode;

  final TextEditingController textEditingController;

  const TimeTextfield(
      {Key? key,
      required this.hitText,
      required this.labelText,
      required this.focusNode,
      required this.textEditingController,
      required this.maxLines,
      required this.message,
      required this.keyboardType,
      this.prefix,
      this.prefixIcon,
      this.surfix,
      this.onChange,
      this.formFieldKey,
      this.extraPadding = 0.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        DatePicker.showTimePicker(context,
            showTitleActions: true, onChanged: (date) {}, onConfirm: (date) {
          textEditingController.text = DateFormat('hh:mm:ss').format(date);
        }, currentTime: DateTime.now());
      },
      child: Material(
        elevation: 2.0,
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        child: Padding(
          padding: EdgeInsets.all(extraPadding),
          child: TextFormField(
            enabled: false,
            onChanged: onChange,
            keyboardType: keyboardType,
            focusNode: focusNode,
            key: formFieldKey,
            controller: textEditingController,
            maxLines: maxLines,
            decoration: InputDecoration(
              prefix: prefix != null ? Text(prefix!) : null,
              suffix: surfix != null ? Text(surfix!) : null,
              prefixIcon: prefixIcon != null
                  ? Material(
                      elevation: 0,
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        prefixIcon,
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  : null,
              hintText: hitText,
              labelText: labelText,
              border: InputBorder.none,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "\t\t\t\t\t\t\t\t\t\t\t\t\t\t" + message;
              } else {
                return null;
              }
            },
          ),
        ),
      ),
    );
  }
}
