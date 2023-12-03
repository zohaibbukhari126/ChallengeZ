import 'package:flutter/material.dart';
import 'login_page.dart';
import 'FitnessPage.dart';
import 'SocialPage.dart';


class MainMenuPage extends StatelessWidget {
  const MainMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Menu'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('Fitness Page'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FitnessPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Social Page'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SocialPage()),
              );
            },
          ),
          // Add more options as needed
        ],
      ),
    );
  }
}
