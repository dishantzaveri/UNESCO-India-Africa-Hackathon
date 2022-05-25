import 'package:flutter/material.dart';
import 'package:partograph/model/mother.dart';
import 'package:partograph/ui/pages/mother/info/admission_information.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AdmissionPage extends StatefulWidget {
  final Mother mother;
  const AdmissionPage({
    Key? key,
    this.isTuitorial = false,
    required this.mother,
  }) : super(key: key);
  final bool isTuitorial;
  @override
  State<AdmissionPage> createState() => _AdmissionPageState();
}

class _AdmissionPageState extends State<AdmissionPage> {
  final controller = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
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
        title: Text(_screenTitles[_currentIndex]),
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          controller: controller,
          children: _screens,
        ),
      ),
      bottomSheet: _currentIndex == _screens.length - 1
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
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _currentIndex == 0
                      ? TextButton(
                          onPressed: () {
                            controller.jumpToPage(_screens.length - 1);
                          },
                          child: const Text("SKIP"))
                      : TextButton(
                          onPressed: () {
                            controller.previousPage(
                                duration: const Duration(microseconds: 500),
                                curve: Curves.easeInOut);
                          },
                          child: const Text("Prev")),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: _screens.length,
                      effect: const WormEffect(
                          spacing: 16, activeDotColor: Colors.cyan),
                      onDotClicked: (index) {
                        controller.animateToPage(index,
                            duration: const Duration(microseconds: 500),
                            curve: Curves.easeInOut);
                      },
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        controller.nextPage(
                            duration: const Duration(microseconds: 500),
                            curve: Curves.easeInOut);
                      },
                      child: const Text("NEXT"))
                ],
              ),
            ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
