import 'package:flutter/material.dart';
import './constants.dart';
import 'resources_main.dart';

class ResList extends StatelessWidget {
  const ResList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> _titles = [
      "Partograph",
      "Digital Partograph ",
    ];
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 120,
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: MY_GRADIENT),
            child: FlexibleSpaceBar(
              centerTitle: false,
              title: Text(
                "Resources",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: ListView.builder(
            primary: false,
            itemCount: _titles.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return ResWidget(
                index: index + 1,
                title: _titles[index],
              );
            },
          ),
        )
      ],
    );
  }
}

class ResWidget extends StatelessWidget {
  final int index;
  final String title;
  const ResWidget({Key? key, required this.index, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ResDetails(title: title)));
      },
      child: Card(
        margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  gradient: MY_GRADIENT,
                  borderRadius: BorderRadius.circular(12)),
              child: Text(
                index.toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w900),
              ),
              margin: const EdgeInsets.all(10),
            ),
            Expanded(
                child: Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            )),
            Icon(
              Icons.chevron_right,
              color: Color.fromRGBO(248, 54, 119, 1),
              size: 30,
            ),
            SizedBox(
              width: 20,
            )
          ],
        ),
      ),
    );
  }
}
