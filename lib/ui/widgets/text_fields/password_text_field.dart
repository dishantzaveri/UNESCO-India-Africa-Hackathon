import 'package:flutter/material.dart';

class PasswordTextfield extends StatefulWidget {
  final String hitText;
  final String labelText;
  final int maxLines;
  final String message;
  final TextInputType keyboardType;
  final double extraPadding;

  final FocusNode focusNode;

  final TextEditingController textEditingController;

  const PasswordTextfield({
    Key? key,
    required this.hitText,
    required this.labelText,
    required this.focusNode,
    required this.textEditingController,
    required this.maxLines,
    required this.message,
    required this.keyboardType,
    this.extraPadding = 0.0,
  }) : super(key: key);

  @override
  State<PasswordTextfield> createState() => _PasswordTextfieldState();
}

class _PasswordTextfieldState extends State<PasswordTextfield> {
  bool _isObsucre = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.0,
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      child: Padding(
        padding: EdgeInsets.all(widget.extraPadding),
        child: Row(
          children: <Widget>[
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: TextFormField(
                obscureText: _isObsucre,
                keyboardType: widget.keyboardType,
                focusNode: widget.focusNode,
                controller: widget.textEditingController,
                maxLines: widget.maxLines,
                decoration: InputDecoration(
                  hintText: widget.hitText,
                  labelText: widget.labelText,
                  icon: const Icon(Icons.lock),
                  border: InputBorder.none,
                ),
                validator: (value) {
                  if (value == null) {
                    return widget.message;
                  } else {
                    return null;
                  }
                },
              ),
            ),
            InkWell(
                onTap: () {
                  setState(() {
                    _isObsucre = !_isObsucre;
                  });
                },
                child: Icon(
                  Icons.remove_red_eye,
                  color: _isObsucre ? Colors.blue : Colors.red,
                )),
            const SizedBox(
              width: 10,
            )
          ],
        ),
      ),
    );
  }
}
