import 'package:flutter/material.dart';
import 'login_page.dart'; // Import your login page
import 'sign_up_page.dart'; // Import your sign-up page

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  LoginPage()),
              );
            },
            child: const Text('Login', style: TextStyle(color: Color.fromRGBO(235, 38, 38, 1))),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignUpPage()),
              );
            },
            child: const Text('Sign Up', style: TextStyle(color: Color.fromARGB(255, 255, 77, 77))),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Welcome to the Fitness App!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            // Additional widgets for your fitness app
          ],
        ),
      ),
    );
  }
}
