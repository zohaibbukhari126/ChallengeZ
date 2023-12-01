import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainMenu(),
    );
  }
}

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Navigate to To-Do List Page
              },
              child: const Text('View To-Dos'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to Add To-Do Item Page
              },
              child: const Text('Add To-Do'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to Completed Tasks Page
              },
              child: const Text('Completed Tasks'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to Settings Page
              },
              child: const Text('Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
