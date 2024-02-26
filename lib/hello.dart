import 'package:flutter/material.dart';
import 'package:flutter_tut/auth_screen.dart';
import 'auth_screen.dart'; // Import the Login page

class HelloPage extends StatelessWidget {
  const HelloPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 20,
            top: 50,
            child: Text(
              'Hello',
              style: TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            left: 37,
            top: 691,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AuthScreen()), // Navigate to the Login page
                );
              },
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.white, // Text color to white
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                minimumSize: Size(350, 46),
                primary: Color.fromARGB(255, 14, 122, 254), // Button color to RGB: 14, 122, 254
              ),
            ),
          ),
          Positioned(
            left: 37,
            top: 747,
            child: ElevatedButton(
              onPressed: () {
                // Navigate to the sign up page
              },
              child: Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.white, // Text color to white
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                minimumSize: Size(350, 46),
                primary: Color.fromARGB(255, 14, 122, 254), // Button color to RGB: 14, 122, 254
              ),
            ),
          ),
        ],
      ),
    );
  }
}
