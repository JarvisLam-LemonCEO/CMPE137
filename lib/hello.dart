import 'package:flutter/material.dart';
import 'package:flutter_tut/auth_screen.dart';
import 'role.dart'; // Import the Role page

class HelloPage extends StatelessWidget {
  const HelloPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double buttonWidth = screenSize.width * 0.7;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 20,
            top: 80,
            child: Text(
              'Hello',
              style: TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            left: screenSize.width * 0.15,
            bottom: 150,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AuthScreen()),
                );
              },

              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                minimumSize: Size(buttonWidth, 46),
                primary: Color.fromARGB(255, 14, 122, 254),
              ),
            ),
          ),
          Positioned(
            left: screenSize.width * 0.15,
            bottom: 100,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Role()), // Navigate to the Role page
                );
              },
              child: Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                minimumSize: Size(buttonWidth, 46),
                primary: Color.fromARGB(255, 14, 122, 254),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
