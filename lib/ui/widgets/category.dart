import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category(
      {Key? key,
      required this.backgroungColor,
      required this.iconColor,
       required this.textColor,
      required this.title,
      required this.subtitle,
      required this.icon,
      required this.onTap})
      : super(key: key);
  final Color backgroungColor;
  final Color iconColor;
   final Color textColor;
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 10.0),
        padding: const EdgeInsets.all(10.0),
        width: 100,
        decoration: BoxDecoration(
            color: backgroungColor,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: SizedBox(
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Center(
                  child: Icon(
                    icon,
                    color: iconColor,
                  ),
                ),
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
              ),
              const Spacer(),
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:   TextStyle(
                    color: textColor, fontWeight: FontWeight.bold),
              ),
              Text(
                subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:   TextStyle(
                  color: textColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
