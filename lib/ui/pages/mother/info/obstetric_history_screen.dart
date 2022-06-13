import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partograph/model/complication.dart';
import 'package:partograph/model/obstetric_history.dart';
import 'package:partograph/provider/mother_provider.dart';
import 'package:partograph/provider/utility_provider.dart';
import 'package:partograph/ui/widgets/buttons/custom_int_dropdown.dart';
import 'package:partograph/ui/widgets/complication_card.dart';
import 'package:partograph/ui/widgets/text_fields/label_text_field.dart';
import 'package:provider/provider.dart';

class ObstetricHistoryScreen extends StatefulWidget {
  const ObstetricHistoryScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ObstetricHistoryScreen> createState() => _ObstetricHistoryScreenState();
}

class _ObstetricHistoryScreenState extends State<ObstetricHistoryScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//private variables;

  int _gravida = 1;
  int _gaInWeeks = 1;
  int _parity = 0;
  int _abortion = 0;
  int _livingChildren = 0;
  final _numbers = [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    53,
    54,
    55,
    56,
    57,
    58,
    59,
    60
  ];

  /// Text Editing Controller
  final TextEditingController _eddTextEditingController =
      TextEditingController();

  final TextEditingController _pastMedicalSurgicalHistoryTextEditingController =
      TextEditingController();
  final TextEditingController _lnmpTextEditingController =
      TextEditingController();

  final GlobalKey<ScaffoldState> _createPersonalInfoScaffoldKey =
      GlobalKey<ScaffoldState>();

  bool _addComplications = false;

  @override
  Widget build(BuildContext context) {
    final _mother = Provider.of<MotherProvider>(context);
    final _utilityProvider = Provider.of<UtilityProvider>(context);
    void _onSave() {
      if (_formKey.currentState!.validate()) {
        final _obstetricHistory = ObstetricHistory(
          id: 0,
          gravida: _gravida,
          gaInWeeks: _gaInWeeks,
          lnmp: _lnmpTextEditingController.text,
          livingChildren: _livingChildren,
          parity: _parity,
          edd: _eddTextEditingController.text,
          pastMedicalSurgicalHistory:
              _pastMedicalSurgicalHistoryTextEditingController.text,
          abortion: _abortion,
        );
        _mother
            .postObstetricHistory(
                _obstetricHistory, _utilityProvider.admissionInfoId)
            .then((value) {
          if (value != null) {
            _lnmpTextEditingController.clear();
            _pastMedicalSurgicalHistoryTextEditingController.clear();

            //show the snackbar
            _utilityProvider.showInSnackBar(
                backgroundColor: Theme.of(context).primaryColor,
                color: Colors.white,
                context: context,
                icon: Icons.check_circle,
                scaffoldKey: _createPersonalInfoScaffoldKey,
                title: 'Mother information created sucessfully');

            // _utilityProvider.currentIndex = 1;
            setState(() {
              _addComplications = true;
            });
          } else {
            //show the snackbar
            _utilityProvider.showInSnackBar(
                color: Colors.red,
                backgroundColor: Colors.black,
                context: context,
                icon: Icons.error,
                scaffoldKey: _createPersonalInfoScaffoldKey,
                title: 'Error while submitting creating');
          }
        });
      }
    }

    return SingleChildScrollView(
      child: _addComplications
          ? Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {},
                        child: const Text("Add Complication")),
                    const SizedBox(
                      width: 50,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                        onPressed: () {},
                        child: const Text("\t\t\tContinue\t\t\t")),
                  ],
                ),
                const Divider(),
                ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ComplicationCard(
                        complication: complicationsList[index],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider();
                    },
                    itemCount: complicationsList.length)
              ],
            )
          : Form(
              key: _formKey,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: CustomIntDropdown(
                        items: _numbers,
                        onChange: (value) {
                          setState(() {
                            _gravida = value!;
                          });
                        },
                        value: _gravida,
                        title: 'Gravida',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: CustomIntDropdown(
                        items: _numbers,
                        onChange: (value) {
                          setState(() {
                            _parity = value!;
                          });
                        },
                        value: _parity,
                        title: 'Parity',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: CustomIntDropdown(
                        items: _numbers,
                        onChange: (value) {
                          setState(() {
                            _livingChildren = value!;
                          });
                        },
                        value: _livingChildren,
                        title: 'Living Children',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: CustomIntDropdown(
                        items: _numbers,
                        onChange: (value) {
                          setState(() {
                            _abortion = value!;
                          });
                        },
                        value: _abortion,
                        title: 'Abortion',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: LabelTextfield(
                        prefixIcon: Icons.circle_sharp,
                        message: 'Please enter EDD',
                        maxLines: 1,
                        hitText: 'Write....',
                        labelText: 'EDD',
                        focusNode: FocusNode(),
                        textEditingController: _eddTextEditingController,
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: LabelTextfield(
                        prefixIcon: Icons.circle_sharp,
                        message: 'Please enter lnmp',
                        maxLines: 1,
                        hitText: 'Write....',
                        labelText: 'lnmp',
                        focusNode: FocusNode(),
                        textEditingController: _lnmpTextEditingController,
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: LabelTextfield(
                        prefixIcon: Icons.local_hospital,
                        message: 'Please enter past medical surgical history',
                        maxLines: 5,
                        hitText: 'Write....',
                        labelText: 'Past medical surgical history',
                        focusNode: FocusNode(),
                        textEditingController:
                            _pastMedicalSurgicalHistoryTextEditingController,
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: CustomIntDropdown(
                        items: _numbers,
                        onChange: (value) {
                          setState(() {
                            _gaInWeeks = value!;
                          });
                        },
                        value: _gaInWeeks,
                        title: 'GA(in weeks)',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Platform.isAndroid
                              ? MaterialButton(
                                  color: Theme.of(context).primaryColor,
                                  child: const Text(
                                    'SAVE',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () => _onSave())
                              : CupertinoButton(
                                  color: Theme.of(context).primaryColor,
                                  child: const Text(
                                    'SAVE',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () => _onSave(),
                                ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
