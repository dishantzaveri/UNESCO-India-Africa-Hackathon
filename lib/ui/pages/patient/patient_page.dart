import 'package:flutter/material.dart';
import 'package:partograph/model/mother.dart';
import 'package:partograph/provider/utility_provider.dart';
import 'package:partograph/ui/pages/indicator/%20indicator_page.dart';
import 'package:partograph/ui/pages/partograph/partograph_page.dart';
import 'package:partograph/ui/widgets/indicator_card.dart';
import 'package:partograph/ui/widgets/titled_header.dart';
import 'package:provider/provider.dart';

class PatientPage extends StatelessWidget {
  const PatientPage({Key? key, required this.mother}) : super(key: key);
  final Mother mother;
  @override
  Widget build(BuildContext context) {
    final _utilityProvider = Provider.of<UtilityProvider>(context);
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
            actions: [
              Tooltip(
                  message: "partograph",
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const PartographPage()));
                      },
                      icon: const Icon(Icons.graphic_eq)))
            ],
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
              title: "PARTOGRAM RECORDING",
            )
          ])),
          SliverPadding(
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 1.0,
                crossAxisCount: 2,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return IndicatorCard(
                    onTap: () {
                      _utilityProvider.selectIndicator(
                          _utilityProvider.indicatorList[index]);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => IndicatorPage(
                                    mother: mother,
                                    indicator:
                                        _utilityProvider.indicatorList[index],
                                  )));
                    },
                    indicator: _utilityProvider.indicatorList[index],
                  );
                },
                childCount: _utilityProvider.indicatorList.length,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
          )
        ],
      ),
    );
  }
}
