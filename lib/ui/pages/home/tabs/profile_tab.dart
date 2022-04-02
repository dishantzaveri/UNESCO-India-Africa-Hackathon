import 'package:flutter/material.dart';
import 'package:partograph/provider/date_schedule_provider.dart';
import 'package:partograph/ui/pages/indicator/List/widget/date_card.dart';
import 'package:partograph/ui/pages/indicator/List/widget/profile_tile.dart';
import 'package:partograph/ui/pages/indicator/List/widget/time_at_work_card.dart';
import 'package:partograph/ui/widgets/titled_header.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final _dateScheduleProvider = Provider.of<DateScheduleProvider>(context);
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
                  'Hilda Mshana',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'Certified Midwife',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ],
            ),
            background: Image.asset(
              'assets/images/header3.jpg',
              fit: BoxFit.fill,
            ),
            titlePadding: const EdgeInsets.only(left: 10, bottom: 10),
          ),
          leading: const SizedBox(),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Column(
            children: [
              ProfileTile(
                  title: "Ratings",
                  subtitle: "4.5",
                  icon: Icons.star,
                  color: Colors.yellow.shade700),
              const ProfileTile(
                  title: "Patient",
                  subtitle: "120 +",
                  icon: Icons.people,
                  color: Colors.white)
            ],
          ),
          const Divider(),
          const SizedBox(
            height: 25,
          ),
          const TitledHeader(
            title: "Biography",
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
            child: Text(
                "Jelly-o carrot cake croissant tart cookie bonbon soufflé. Gummies cotton candy macaroon caramels muffin liquorice. Bear claw pie pastry donut chupa chups icing."),
          ),
          const SizedBox(
            height: 50,
          ),
          const TitledHeader(
            title: "Schedule",
          ),
        ])),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 70.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return DateCard(
                  dateSchedule: _dateScheduleProvider.dateScheduleList[index],
                  onTap: () {
                    _dateScheduleProvider.selectDate(
                        _dateScheduleProvider.dateScheduleList[index]);
                  },
                );
              },
              itemCount: _dateScheduleProvider.dateScheduleList.length,
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          const SizedBox(
            height: 5,
          ),
            Padding(
            padding: const EdgeInsets.all(8.0),
            child: TimeAtWorkCard(
              dateSchedule: _dateScheduleProvider.dateScheduleList
                  .firstWhere((element) => element.isSelected),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
        ])),
      ],
    );
  }
}
