import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mother_and_baby/constants/enum.dart';
import 'package:mother_and_baby/provider/mother_provider.dart';
import 'package:mother_and_baby/ui/pages/mother/partograph_info_page.dart';
import 'package:mother_and_baby/ui/pages/mother/create_mother_page.dart';
import 'package:mother_and_baby/ui/widgets/loader.dart';
import 'package:mother_and_baby/ui/widgets/tiles/no_item_tile.dart';
import 'package:mother_and_baby/ui/widgets/patient_card.dart';
import 'package:mother_and_baby/ui/widgets/titled_header.dart';

import 'package:provider/provider.dart';

class PatientList extends StatefulWidget {
  const PatientList({Key? key}) : super(key: key);

  @override
  _PatientListState createState() => _PatientListState();
}

CaseCategory? _caseCategory;

class _PatientListState extends State<PatientList>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final _motherProvider = Provider.of<MotherProvider>(context);

    return Scaffold(
        appBar: AppBar(title: const Text("Patient Registration")),
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          slivers: <Widget>[
            CupertinoSliverRefreshControl(
              onRefresh: () async {
                await _motherProvider.loadMothers();
              },
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
                      decoration: const InputDecoration(
                          hintText: 'Search', border: InputBorder.none),
                    ))
                  ],
                ),
              ),
              const TitledHeader(
                title: "Patients",
              )
            ])),
            _motherProvider.isLoadingMotherData
                ? SliverList(
                    delegate: SliverChildListDelegate([const Loader()]))
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
                            caseCategory: _caseCategory, reverse: true)[index],
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => PartographInfoPage(
                                        mother: _motherProvider.currentPatients(
                                            caseCategory: _caseCategory,
                                            reverse: true)[index],
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
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const CreateMotherPage()));
          },
          child: const Icon(Icons.add),
        ));
  }
}
