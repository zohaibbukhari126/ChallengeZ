import 'package:flutter/material.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  DateTime? _selectedDate;
  String? _selectedCountry;
  int? _age;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month && currentDate.day < birthDate.day)) {
      age--;
    }
    setState(() {
      _age = age;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _calculateAge(picked);
      });
    }
  }

  Future<void> _submitSignUp() async {
  // Basic validation
  if (_nameController.text.isEmpty ||
      _emailController.text.isEmpty ||
      _passwordController.text.isEmpty ||
      _passwordController.text != _confirmPasswordController.text ||
      _selectedDate == null ||
      _selectedCountry == null) {
    // Show error message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Please fill in all fields correctly')),
    );
    return;
  }

  try {
    // Show loading indicator
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    // Store user data
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', _nameController.text);
    await prefs.setString('userEmail', _emailController.text);
    await prefs.setString('userPassword', _passwordController.text); // Not secure

    // Hide loading indicator
    Navigator.pop(context);

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Sign Up Successful')),
    );
  } catch (e) {
    // Hide loading indicator
    Navigator.pop(context);

    // Handle exceptions
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to sign up: $e')),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Full Name'),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email Address'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: AbsorbPointer(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Date of Birth',
                    hintText: _selectedDate == null
                        ? 'Select your date of birth'
                        : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                  ),
                ),
              ),
            ),
            if (_age != null) Text('Age: $_age'),
            const SizedBox(height: 8),
            CountryListPick(
              appBar: AppBar(
                backgroundColor: Colors.blue,
                title: const Text('Choose a country'),
              ),
              theme: CountryTheme(
                isShowFlag: true,
                isShowTitle: true,
                isShowCode: false,
                isDownIcon: true,
                showEnglishName: true,
              ),
              initialSelection: '+62',
              onChanged: (CountryCode? code) {
                setState(() {
                  _selectedCountry = code?.name;
                });
              },
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Set Password'),
              obscureText: true,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _confirmPasswordController,
              decoration: const InputDecoration(labelText: 'Confirm Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitSignUp,
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
