import 'package:flutter/material.dart';
import 'package:partograph/model/indicator.dart';

class IndicatorCard extends StatelessWidget {
  const IndicatorCard({Key? key, required this.indicator, required this.onTap})
      : super(key: key);
  final Indicator indicator;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: indicator.isSelected ? const Color.fromARGB(255, 253, 93, 146) : Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(5.0))),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              indicator.icon,
              height: 50,
            ),
            Text(
              indicator.title,
              style: TextStyle(
                  color: indicator.isSelected ? Colors.white : Colors.black),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
