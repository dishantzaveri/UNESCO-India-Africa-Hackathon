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
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 70,
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
              width: 50,
              height: 50,
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
                  mother.surname + " " + mother.otherNames,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Ward No  #",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
            const Spacer(),
            Container(
              child: Center(
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 25,
                  color: color,
                ),
              ),
              width: 40,
              height: 40,
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
