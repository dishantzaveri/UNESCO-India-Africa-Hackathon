import 'package:flutter/material.dart';
import 'package:partograph/constants/enum.dart';
import 'package:partograph/provider/mother_provider.dart';
import 'package:partograph/ui/pages/patient/patient_history_page.dart';
import 'package:partograph/ui/widgets/patient_card.dart';
import 'package:partograph/ui/widgets/titled_header.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage(
      {Key? key, required this.title, required this.caseCategory})
      : super(key: key);
  final String title;
  final CaseCategory caseCategory;

  @override
  Widget build(BuildContext context) {
    final _motherProvider = Provider.of<MotherProvider>(context);

    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          expandedHeight: MediaQuery.of(context).size.height * 0.2,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              title,
              style: const TextStyle(color: Colors.white),
            ),
              background: Image.asset(
              'assets/images/header1.jpg',
              fit: BoxFit.fill,
            ),
            titlePadding: const EdgeInsets.only(left: 10, bottom: 10),
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
              children: const [
                Icon(Icons.search_sharp),
                SizedBox(
                  width: 10,
                ),
                Text('ALL')
              ],
            ),
          ),
          const TitledHeader(
            title: "Patients",
          )
        ])),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
          return PatientCard(
            color: Colors.pink,
            mother: _motherProvider.motherByCategory(
                caseCategory: caseCategory)[index],
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => PatientHistoryPage(
                            mother: _motherProvider.motherByCategory(
                                caseCategory: caseCategory)[index],
                          )));
            },
          );
        },
                childCount: _motherProvider
                    .motherByCategory(caseCategory: caseCategory)
                    .length)),
      ],
    ));
  }
}
