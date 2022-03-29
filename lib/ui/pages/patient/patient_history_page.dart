import 'package:flutter/material.dart';
import 'package:partograph/model/mother.dart';
import 'package:partograph/ui/pages/partograph/partograph_page.dart';
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
            ),
           
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: const EdgeInsets.only(left: 10, top: 10, right: 10),
              padding: const EdgeInsets.only(left: 10, right: 10),
              height: 180,
              decoration: const BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitledHeader(
                    title: "Patient Information",
                    color: Colors.white,
                  ),
                  const Divider(),
                  Row(
                    children: [
                      const Text(
                        'Fullname: ',
                        style: TextStyle(color: Colors.white),
                      ),
                      Expanded(
                        child: Text(
                          mother.fullname,
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'AGE: ',
                        style: TextStyle(color: Colors.white),
                      ),
                      Expanded(
                        child: Text(
                          "${mother.age}",
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Parity/Gravida: ',
                        style: TextStyle(color: Colors.white),
                      ),
                      Expanded(
                        child: Text(
                          '${mother.parity}',
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Gestational period: ',
                        style: TextStyle(color: Colors.white),
                      ),
                      Expanded(
                        child: Text(
                          mother.gestationPeriod,
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Date/time of admission: ',
                        style: TextStyle(color: Colors.white),
                      ),
                      Expanded(
                        child: Text(
                          "${mother.admissionDate}",
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Time of rupture membrane: ',
                        style: TextStyle(color: Colors.white),
                      ),
                      Expanded(
                        child: Text(
                          "${mother.membraneRaptureTime}",
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Short antenatal history: ',
                        style: TextStyle(color: Colors.white),
                      ),
                      Expanded(
                        child: Text(
                          mother.history,
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
