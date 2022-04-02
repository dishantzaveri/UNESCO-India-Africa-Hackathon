import 'package:flutter/material.dart';
import 'package:partograph/model/mother.dart';
import 'package:partograph/ui/pages/partograph/partograph_page.dart';
import 'package:partograph/ui/pages/patient/patient_history_card.dart';
import 'package:partograph/ui/widgets/titled_header.dart';

class PatientHistoryPage extends StatelessWidget {
  const PatientHistoryPage({Key? key, required this.mother}) : super(key: key);
  final Mother mother;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.2,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                mother.fullname,
              ),
              titlePadding: const EdgeInsets.only(left: 10, bottom: 10),
            
               background: Image.asset(
              'assets/images/header5.jpg',
              fit: BoxFit.fill,
            ),
            ),
            
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            PatientHistoryCard(mother: mother),
            const TitledHeader(
              title: "PARTOGRAMS",
            )
          ])),
          SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                child: ListTile(
                  title: Text('Partogram $index'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const PartographPage()));
                  },
                  leading: const Icon(Icons.graphic_eq),
                ),
              ),
            );
          }, childCount: 4)),
        ],
      ),
    );
  }
}
