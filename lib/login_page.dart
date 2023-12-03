import 'package:flutter/material.dart';
import 'package:myapp/MainMenuPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<bool> _login() async {
    final prefs = await SharedPreferences.getInstance();
    final storedEmail = prefs.getString('userEmail') ?? '';
    final storedPassword = prefs.getString('userPassword') ?? '';

    return _emailController.text == storedEmail && _passwordController.text == storedPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.grey[850], // Dark background color for AppBar
      ),
      backgroundColor: Colors.grey[900], // Dark background color for the page
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email Address',
                labelStyle: TextStyle(color: Colors.white), // White text color
                fillColor: Colors.white24, // Slight white fill
                filled: true,
              ),
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(color: Colors.white), // White input text color
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.white), // White text color
                fillColor: Colors.white24, // Slight white fill
                filled: true,
              ),
              obscureText: true,
              style: const TextStyle(color: Colors.white), // White input text color
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (await _login()) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MainMenuPage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Invalid credentials')),
                  );
                }
              },
              child: const Text('Login'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Button color
                onPrimary: Colors.white, // Button text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
