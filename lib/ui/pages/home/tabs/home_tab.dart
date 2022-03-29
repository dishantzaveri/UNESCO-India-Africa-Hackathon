import 'package:flutter/material.dart';
import 'package:partograph/provider/auth_provider.dart';
import 'package:partograph/provider/mother_provider.dart';
import 'package:partograph/ui/pages/patient/patient_page.dart';
import 'package:partograph/ui/widgets/category.dart';
import 'package:partograph/ui/widgets/patient_card.dart';
import 'package:partograph/ui/widgets/titled_header.dart';

import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final _authProvider = Provider.of<AuthProvider>(context);
    final _motherProvider = Provider.of<MotherProvider>(context);
    return CustomScrollView(
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
            // background: Image.asset(
            //   'assets/headers/header4.jpeg',
            //   fit: BoxFit.fill,
            // ),
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
              child: Image.network('${_authProvider.authenicatedUser?.avatar}'),
            ),
            const SizedBox(
              width: 10,
            )
          ],
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
              children: const [
                Category(
                  backgroungColor: Colors.pinkAccent,
                  iconColor: Colors.red,
                  subtitle: '5 Patients',
                  title: 'Critical',
                  icon: Icons.heart_broken,
                ),
                Category(
                    backgroungColor: Colors.blue,
                    iconColor: Colors.red,
                    subtitle: '4 Patients',
                    title: 'Active Phase',
                    icon: Icons.local_hospital),
                Category(
                    backgroungColor: Colors.cyan,
                    iconColor: Colors.red,
                    subtitle: '9 Patients',
                    title: 'Latent Phase',
                    icon: Icons.favorite),
                Category(
                    backgroungColor: Colors.orange,
                    iconColor: Colors.red,
                    subtitle: '12 Patients',
                    title: 'Incoming',
                    icon: Icons.access_alarm)
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
                      builder: (_) => PatientPage(
                            mother: _motherProvider.motherList[index],
                          )));
            },
          );
        }, childCount: _motherProvider.motherList.length)),
      ],
    );
  }
}
