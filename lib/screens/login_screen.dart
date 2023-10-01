import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'contact_list_screen.dart';

class User {
  final String username;
  final String password;

  User({required this.username, required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: "@abc123",
      password: "neeraj18",
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _validateEmail = false;

  Future<void> _login() async {
    // Validate email
    if (emailController.text.isEmpty) {
      setState(() {
        _validateEmail = true;
      });
      return;
    } else {
      setState(() {
        _validateEmail = false;
      });
    }

    // Validate password (add your password validation logic here if needed)
    if (passwordController.text.isEmpty) {
      // Handle password validation error
      return;
    }

    // Prepare the login data
    final Map<String, dynamic> loginData = {
      'username': emailController.text, // Use the email as the username
      'password': passwordController.text,
    };

    try {
      // Make a POST request to the API
      final response = await http.post(
        Uri.parse(
            'http://127.0.0.1:8000/api/login/'), // Replace with your API endpoint URL
        // body: json.encode(loginData),
        body: jsonEncode({
          'username': "@abc123",
          'password': "neeraj18",
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // The login was successful; navigate to ContactListScreen.
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => ContactListScreen(),
          ),
        );
      } else {
        // Handle API error (show an error message).
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Invalid credentials or an error occurred'),
          ),
        );
      }
    } catch (e) {
      // Handle network or other exceptions here
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred. Please try again later.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Replace this with your image widget
                Image.asset(
                  "asset/images/undraw_secure_login_pdn4.png",
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 8.0),

                // Replace this with your text widget
                Text(
                  'Welcome to SyncMate',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),

                // Replace this with your email TextField widget
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    errorText: _validateEmail ? 'Email can\'t be empty' : null,
                  ),
                ),
                SizedBox(height: 8.0),

                // Replace this with your password TextField widget
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 8.0),

                // Replace this with your login button widget
                ElevatedButton(
                  onPressed: _login,
                  child: Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
