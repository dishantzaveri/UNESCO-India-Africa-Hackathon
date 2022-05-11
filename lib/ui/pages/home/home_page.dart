import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:partograph/ui/pages/drawer/drawer_page.dart';
import 'package:partograph/ui/pages/home/tabs/history_tab.dart';
import 'package:partograph/ui/pages/home/tabs/home_tab.dart';
import 'package:partograph/ui/pages/home/tabs/profile_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  List<Widget> _screens = [];

  @override
  void initState() {
    super.initState();
    _screens = [const HomeTab(), const HistoryTab(), const ProfileTab()];
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      duration: const Duration(milliseconds: 300),
      data: Theme.of(context),
      child: Scaffold(
        key: _scaffoldKey,
        body: _screens.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.home), label: "Home"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.explore), label: "History"),
            BottomNavigationBarItem(
              icon: Badge(
                showBadge: false,
                badgeContent: const Text(
                  '0',
                  style: TextStyle(color: Colors.white),
                ),
                child: CircleAvatar(
                    backgroundColor: _selectedIndex == 2
                        ? const Color.fromRGBO(248, 54, 119, 1)
                        : Colors.grey.shade400,
                    radius: 14,
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                    )),
              ),
              label: "Profile",
            ),
          ],
        ),
        endDrawer: _selectedIndex == 2 ? const DrawerPage() : Container(),
      ),
    );
  }
}
