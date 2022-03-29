import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef MobileTextfieldOnChange = Function(String);
typedef MobileCountryCodeOnChange = Function(Country);

class MobileTextfield extends StatelessWidget {
  final String hitText;
  final String labelText;
  final int maxLines;
  final String message;
  final TextInputType keyboardType;
  final MobileTextfieldOnChange onChange;
  final MobileCountryCodeOnChange onCodeChange;
  final GlobalKey<FormFieldState> formFieldKey;
  final double extraPadding;

  final FocusNode focusNode;
  final Country country;

  final TextEditingController textEditingController;
  final _UsNumberTextInputFormatter _phoneNumberFormatter =
      _UsNumberTextInputFormatter();

  MobileTextfield(
      {Key? key,
      required this.hitText,
      required this.labelText,
      required this.focusNode,
      required this.textEditingController,
      required this.maxLines,
      required this.message,
      required this.onCodeChange,
      required this.keyboardType,
      required this.onChange,
      required this.formFieldKey,
      this.extraPadding = 0.0,
      required this.country})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.0,
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      child: Padding(
        padding: EdgeInsets.all(extraPadding),
        child: Row(
          children: <Widget>[
            InkWell(
              onTap: () {
                showCountryPicker(
                  context: context,
                  countryListTheme: CountryListThemeData(
                    flagSize: 25,
                    backgroundColor: Colors.white,
                    textStyle:
                        const TextStyle(fontSize: 16, color: Colors.blueGrey),
                    //Optional. Sets the border radius for the bottomsheet.
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                    //Optional. Styles the search field.
                    inputDecoration: InputDecoration(
                      labelText: 'Search',
                      hintText: 'Start typing to search',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color(0xFF8C98A8).withOpacity(0.2),
                        ),
                      ),
                    ),
                  ),
                  onSelect: onCodeChange,
                );
              },
              child: Container(
                  height: 50,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Center(
                      child: Text(
                    "+ ${country.phoneCode}",
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                  ))),
            ),
            Container(
              height: 50,
              width: 2,
              color: Colors.black45,
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: TextFormField(
                onChanged: onChange,
                keyboardType: keyboardType,
                focusNode: focusNode,
                key: formFieldKey,
                inputFormatters: <TextInputFormatter>[
                  LengthLimitingTextInputFormatter(13),
                  FilteringTextInputFormatter.digitsOnly,
                  FilteringTextInputFormatter.singleLineFormatter,
                  _phoneNumberFormatter,
                ],
                controller: textEditingController,
                maxLines: maxLines,
                decoration: InputDecoration(
                  hintText: hitText,
                  labelText: labelText,
                  border: InputBorder.none,
                ),
                validator: (value) {
                  if (value == null) {
                    return message;
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Format incoming numeric text to fit the format of (###) ###-#### ##...
class _UsNumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;
    int usedSubstringIndex = 0;
    final StringBuffer newText = StringBuffer();
    if (newTextLength >= 1) {
      newText.write('(');
      if (newValue.selection.end >= 1) selectionIndex++;
    }
    if (newTextLength >= 4) {
      newText.write(newValue.text.substring(0, usedSubstringIndex = 3) + ') ');
      if (newValue.selection.end >= 3) selectionIndex += 2;
    }
    if (newTextLength >= 7) {
      newText.write(newValue.text.substring(3, usedSubstringIndex = 6) + '-');
      if (newValue.selection.end >= 6) selectionIndex++;
    }
    if (newTextLength >= 11) {
      newText.write(newValue.text.substring(6, usedSubstringIndex = 10) + ' ');
      if (newValue.selection.end >= 10) selectionIndex++;
    }
    // Dump the rest.
    if (newTextLength >= usedSubstringIndex) {
      newText.write(newValue.text.substring(usedSubstringIndex));
    }
    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
