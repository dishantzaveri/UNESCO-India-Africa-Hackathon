import 'package:flutter/material.dart';
 
class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.color_lens),
            title: const Text('Settings'),
            onTap: () {
           
            },
          )
        ],
      )),
    );
  }
}
