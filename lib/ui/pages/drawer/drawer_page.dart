import 'package:flutter/material.dart';
import 'package:mother_and_baby/ui/pages/auth/login_page.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
          child: Column(
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Color.fromRGBO(248, 54, 119, 1)),
            accountName: Text("Dishant Zaveri"),
            accountEmail: Text("zaveridishant@gmail.com"),
            currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.jpg')),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.security),
            title: const Text('Privacy'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Log out'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => LoginPage()));
            },
          )
        ],
      )),
    );
  }
}
