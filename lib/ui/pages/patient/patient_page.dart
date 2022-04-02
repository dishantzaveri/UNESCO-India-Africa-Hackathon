import 'package:flutter/material.dart';
import 'package:partograph/model/mother.dart';
import 'package:partograph/provider/utility_provider.dart';
import 'package:partograph/ui/pages/indicator/indicator_page.dart';
import 'package:partograph/ui/pages/partograph/partograph_page.dart';
import 'package:partograph/ui/pages/patient/patient_history_card.dart';
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
              background: Image.asset(
                'assets/images/header5.jpg',
                fit: BoxFit.fill,
              ),
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
            PatientHistoryCard(mother: mother),
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
