import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partograph/constants/enum.dart';
import 'package:partograph/provider/mother_provider.dart';
import 'package:partograph/ui/pages/patient/patient_page.dart';
import 'package:partograph/ui/widgets/category.dart';
import 'package:partograph/ui/widgets/loader.dart';
import 'package:partograph/ui/widgets/tiles/no_item_tile.dart';
import 'package:partograph/ui/widgets/patient_card.dart';
import 'package:partograph/ui/widgets/titled_header.dart';

import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

CaseCategory? _caseCategory;

class _HomeTabState extends State<HomeTab> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final _motherProvider = Provider.of<MotherProvider>(context);

    return CustomScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          expandedHeight: MediaQuery.of(context).size.height * 0.2,
          flexibleSpace: FlexibleSpaceBar(
            title: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Good Morning',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'Hilda 👋',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
            background: Image.asset(
              'assets/images/header1.jpg',
              fit: BoxFit.fill,
            ),
            titlePadding: const EdgeInsets.only(left: 10, bottom: 10),
          ),
          leading: const SizedBox(),
          actions: [
            Container(
              width: 55,
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Image.asset('assets/images/profile.jpg'),
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        CupertinoSliverRefreshControl(
          onRefresh: () async {
            await _motherProvider.loadMothers();
          },
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          const TitledHeader(
            title: "Case Categories",
          )
        ])),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 100.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Category(
                  backgroungColor: _caseCategory == null
                      ? Colors.pinkAccent
                      : Colors.black12,
                  iconColor: Colors.red,
                  textColor:
                      _caseCategory == null ? Colors.white : Colors.black,
                  subtitle:
                      '${_motherProvider.currentPatients().length}  Patients',
                  title: 'All',
                  icon: Icons.local_hospital,
                  onTap: () {
                    setState(() {
                      _caseCategory = null;
                    });
                  },
                ),
                Category(
                  backgroungColor: _caseCategory == CaseCategory.critical
                      ? Colors.pinkAccent
                      : Colors.black12,
                  iconColor: Colors.red,
                  subtitle:
                      '${_motherProvider.currentPatients(caseCategory: CaseCategory.critical).length} Patients',
                  textColor: _caseCategory == CaseCategory.critical
                      ? Colors.white
                      : Colors.black,
                  title: 'Critical',
                  icon: Icons.heart_broken,
                  onTap: () {
                    setState(() {
                      _caseCategory = CaseCategory.critical;
                    });
                  },
                ),
                Category(
                  backgroungColor: _caseCategory == CaseCategory.active
                      ? Colors.pinkAccent
                      : Colors.black12,
                  iconColor: Colors.red,
                  textColor: _caseCategory == CaseCategory.active
                      ? Colors.white
                      : Colors.black,
                  subtitle:
                      '${_motherProvider.currentPatients(caseCategory: CaseCategory.active).length} Patients',
                  title: 'Active Phase',
                  icon: Icons.local_hospital,
                  onTap: () {
                    setState(() {
                      _caseCategory = CaseCategory.active;
                    });
                  },
                ),
                Category(
                  backgroungColor: _caseCategory == CaseCategory.latent
                      ? Colors.pinkAccent
                      : Colors.black12,
                  iconColor: Colors.red,
                  textColor: _caseCategory == CaseCategory.latent
                      ? Colors.white
                      : Colors.black,
                  subtitle:
                      '${_motherProvider.currentPatients(caseCategory: CaseCategory.latent).length} Patients',
                  title: 'Latent Phase',
                  icon: Icons.favorite,
                  onTap: () {
                    setState(() {
                      _caseCategory = CaseCategory.latent;
                    });
                  },
                ),
                Category(
                  backgroungColor: _caseCategory == CaseCategory.incoming
                      ? Colors.pinkAccent
                      : Colors.black12,
                  iconColor: Colors.red,
                  textColor: _caseCategory == CaseCategory.incoming
                      ? Colors.white
                      : Colors.black,
                  subtitle:
                      '${_motherProvider.currentPatients(caseCategory: CaseCategory.incoming).length} Patients',
                  title: 'Incoming',
                  icon: Icons.access_alarm,
                  onTap: () {
                    setState(() {
                      _caseCategory = CaseCategory.incoming;
                    });
                  },
                )
              ],
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
            margin: const EdgeInsets.only(left: 10, top: 10),
            padding: const EdgeInsets.only(left: 10),
            height: 50,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20))),
            child: Row(
              children: [
                const Icon(Icons.search_sharp),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: TextFormField(
                  decoration: const InputDecoration(hintText: 'Search', border: InputBorder.none),
                ))
              ],
            ),
          ),
          const TitledHeader(
            title: "Patients",
          )
        ])),
        _motherProvider.isLoadingMotherData
            ? SliverList(delegate: SliverChildListDelegate([const Loader()]))
            : SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                if (_motherProvider
                    .currentPatients(caseCategory: _caseCategory)
                    .isEmpty) {
                  return NoItemTile(
                    color: Colors.pinkAccent,
                    icon: Icons.people,
                    title:
                        'No ${_caseCategory != null ? _caseCategory.toString().replaceAll("CaseCategory.", "") : ''} patients',
                  );
                } else {
                  return PatientCard(
                    color: const Color.fromRGBO(248, 54, 119, 1),
                    mother: _motherProvider.currentPatients(
                        caseCategory: _caseCategory)[index],
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => PatientPage(
                                    mother: _motherProvider.currentPatients(
                                        caseCategory: _caseCategory)[index],
                                  )));
                    },
                  );
                }
              },
                    childCount: _motherProvider
                            .currentPatients(caseCategory: _caseCategory)
                            .isEmpty
                        ? 1
                        : _motherProvider
                            .currentPatients(caseCategory: _caseCategory)
                            .length)),
      ],
    );
  }
}
