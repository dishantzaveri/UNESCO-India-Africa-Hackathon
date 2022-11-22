import 'package:flutter/material.dart';

class NoItemTile extends StatelessWidget {
  const NoItemTile(
      {Key? key,
      this.height = 100,
      required this.title,
      required this.icon,
      required this.color})
      : super(key: key);
  final double height;
  final String title;
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: height,
          ),
          Center(
            child: Row(
              children:   [
              const  Spacer(),
                Icon(
                  icon,
                  size: 50,
                  color: color,
                ),
             const   Spacer()
              ],
            ),
          ),
          Text(title)
        ],
      ),
    );
  }
}
