import 'package:flutter/material.dart';

class TitledHeader extends StatelessWidget {
  const TitledHeader({Key? key, required this.title, this.color = Colors.black})
      : super(key: key);
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
      child: Text(
        title,
        style:
            TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color),
      ),
    );
  }
}
