import 'package:flutter/material.dart';
import 'package:myapp/my_home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<bool> _login() async {
    final prefs = await SharedPreferences.getInstance();
    final storedEmail = prefs.getString('userEmail') ?? '';
    final storedPassword = prefs.getString('userPassword') ?? ''; // Not secure

    return _emailController.text == storedEmail && _passwordController.text == storedPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email Address'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (await _login()) {
                  // Navigate to the next screen if login is successful
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyHomePage(title : 'Challenge Z Logged In')),
                  );
                } else {
                  // Show error message
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Invalid credentials')),
                  );
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
