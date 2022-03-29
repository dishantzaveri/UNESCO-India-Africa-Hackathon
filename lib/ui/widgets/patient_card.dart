import 'package:flutter/material.dart';
import 'package:partograph/model/mother.dart';

class PatientCard extends StatelessWidget {
  const PatientCard({
    Key? key,
    required this.color,
    required this.mother,
    required this.onTap,
  }) : super(key: key);
  final Color color;
  final Mother mother;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2.5),
        padding: const EdgeInsets.all(5.0),
        height: 50,
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Row(
          children: [
            Container(
              child: Center(
                child: Icon(
                  Icons.person,
                  color: color,
                ),
              ),
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  mother.fullname,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Ward No ${mother.age}",
                )
              ],
            ),
            const Spacer(),
            Container(
              child: Center(
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: color,
                ),
              ),
              width: 25,
              height: 25,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
            ),
          ],
        ),
      ),
    );
  }
}
