import 'package:flutter/material.dart';
import 'package:partograph/provider/auth_provider.dart';
import 'package:partograph/provider/mother_provider.dart';
import 'package:partograph/ui/pages/patient/patient_history_page.dart';
import 'package:partograph/ui/pages/patient/patient_page.dart';
import 'package:partograph/ui/widgets/category.dart';
import 'package:partograph/ui/widgets/patient_card.dart';
import 'package:partograph/ui/widgets/titled_header.dart';

import 'package:provider/provider.dart';

class HistoryTab extends StatefulWidget {
  const HistoryTab({Key? key}) : super(key: key);

  @override
  _HistoryTabState createState() => _HistoryTabState();
}

class _HistoryTabState extends State<HistoryTab>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final _authProvider = Provider.of<AuthProvider>(context);
    final _motherProvider = Provider.of<MotherProvider>(context);
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          expandedHeight: MediaQuery.of(context).size.height * 0.2,
          flexibleSpace: const FlexibleSpaceBar(
            title: Text(
              'History',
              style: TextStyle(color: Colors.white),
            ),
            // background: Image.asset(
            //   'assets/headers/header4.jpeg',
            //   fit: BoxFit.fill,
            // ),
            titlePadding: EdgeInsets.only(left: 10, bottom: 10),
          ),
          leading: const SizedBox(),
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
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
          return PatientCard(
            color: Colors.pink,
            mother: _motherProvider.motherList[index],
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => PatientHistoryPage(
                            mother: _motherProvider.motherList[index],
                          )));
            },
          );
        }, childCount: _motherProvider.motherList.length)),
        
      ],
    );
  }
}
