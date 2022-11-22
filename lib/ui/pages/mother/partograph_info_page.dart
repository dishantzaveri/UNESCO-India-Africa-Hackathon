// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:mother_and_baby/model/mother.dart';
import 'package:mother_and_baby/provider/utility_provider.dart';
import 'package:mother_and_baby/ui/pages/mother/info/obstetric_history_screen.dart';
import 'package:mother_and_baby/ui/pages/mother/info/admission_information_screen.dart';
import 'package:provider/provider.dart';

class PartographInfoPage extends StatefulWidget {
  final Mother mother;
  const PartographInfoPage({
    Key? key,
    this.isTuitorial = false,
    required this.mother,
  }) : super(key: key);
  final bool isTuitorial;
  @override
  State<PartographInfoPage> createState() => _PartographInfoPageState();
}

class _PartographInfoPageState extends State<PartographInfoPage> {
  @override
  Widget build(BuildContext context) {
    final _utilityProvider = Provider.of<UtilityProvider>(context);
    final List<Widget> _screens = [
      AdmissionInformationScreen(
        mother: widget.mother,
      ),
      const ObstetricHistoryScreen(),
      AdmissionInformationScreen(
        mother: widget.mother,
      ),
      AdmissionInformationScreen(
        mother: widget.mother,
      ),
      AdmissionInformationScreen(
        mother: widget.mother,
      ),
      AdmissionInformationScreen(
        mother: widget.mother,
      )
    ];

    final List<String> _screenTitles = [
      "ADMISSION INFORMATION",
      "OBSTETRIC HISTORY",
      "CURRENT PREGNANCY",
      "CURRENT PREGNANCY",
      "INITIAL EXAMINATION",
      "INITIAL EXAMINATION"
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text(_screenTitles[_utilityProvider.currentIndex]),
        ),
        body: Container(
          padding: const EdgeInsets.only(bottom: 80),
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              _utilityProvider.currentIndex = index;
            },
            controller: _utilityProvider.controller,
            children: _screens,
          ),
        ),
        bottomSheet: _utilityProvider.currentIndex == _screens.length - 1
            ? TextButton(
                onPressed: () {
                  if (widget.isTuitorial) {
                    Navigator.pop(context);
                  } else {
                    // Navigator.of(context)
                    //     .pushReplacementNamed(offlineConfigPageRouteAndroid);
                  }
                },
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2)),
                    primary: Colors.white,
                    backgroundColor: Colors.pink.shade700,
                    minimumSize: const Size.fromHeight(80)),
                child: const Text(
                  "Start Partograph",
                  style: TextStyle(fontSize: 24),
                ))
            : Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 80,
                child: Row(
                  children: [
                    const Spacer(),
                    Center(
                        child: Text(
                            '${_utilityProvider.currentIndex + 1} / ${_screens.length}')),
                    const Spacer()
                  ],
                ),
              )

        // Container(
        //     height: 80,
        //     padding: const EdgeInsets.symmetric(horizontal: 20),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         _currentIndex == 0
        //             ? TextButton(
        //                 onPressed: () {
        //                   controller.jumpToPage(_screens.length - 1);
        //                 },
        //                 child: const Text("SKIP"))
        //             : TextButton(
        //                 onPressed: () {
        //                   controller.previousPage(
        //                       duration: const Duration(microseconds: 500),
        //                       curve: Curves.easeInOut);
        //                 },
        //                 child: const Text("Prev")),
        //         Center(
        //           child: SmoothPageIndicator(
        //             controller: controller,
        //             count: _screens.length,
        //             effect: const WormEffect(
        //                 spacing: 16, activeDotColor: Colors.cyan),
        //             onDotClicked: (index) {
        //               controller.animateToPage(index,
        //                   duration: const Duration(microseconds: 500),
        //                   curve: Curves.easeInOut);
        //             },
        //           ),
        //         ),
        //         TextButton(
        //             onPressed: () {
        //               controller.nextPage(
        //                   duration: const Duration(microseconds: 500),
        //                   curve: Curves.easeInOut);
        //             },
        //             child: const Text("NEXT"))
        //       ],
        //     ),
        //   ),

        );
  }
}
