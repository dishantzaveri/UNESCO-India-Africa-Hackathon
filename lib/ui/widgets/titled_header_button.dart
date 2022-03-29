import 'package:flutter/material.dart';

class TitledHeaderButton extends StatelessWidget {
  const TitledHeaderButton(
      {Key? key, required this.title, this.color = Colors.black, required this.onPressed})
      : super(key: key);
  final String title;
  final Color color;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: color),
            ),
          ),
          IconButton(
            onPressed: onPressed,
            icon: const Icon(Icons.add, color: Colors.cyan,),
            tooltip: "Add",
          )
        ],
      ),
    );
  }
}
