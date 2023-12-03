import 'package:flutter/material.dart';
import 'my_home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Challenge Z',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(243, 100, 56, 1)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Challenge Z'),
    );
  }
}
