import 'package:flutter/material.dart';

class SocialPage extends StatelessWidget {
  const SocialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Social Page'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(title: const Text('Friends')),
          ListTile(title: const Text('Message')),
          ListTile(title: const Text('Global Timeline')),
          // Add more options as needed
        ],
      ),
    );
  }
}
