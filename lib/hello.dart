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
          // Background Image
          Image.asset(
            'assets/FirstPage.jpg',
            width: screenSize.width,
            height: screenSize.height,
            fit: BoxFit.cover,
          ),
          // Join The Movement Button
          Positioned(
            left: screenSize.width * 0.15,
            bottom: 150,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Role()),
                );
              },
              child: Text(
                'Join The Movement',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'BalooBhai2', // Using Baloo Bhai 2 font
                  fontSize: 20, // Adjust font size as needed
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                backgroundColor: Color.fromARGB(255, 195, 154, 220),
                minimumSize: Size(buttonWidth, 46),
              ),
            ),
          ),
          // Login Button
          Positioned(
            left: screenSize.width * 0.15,
            bottom: 210, // Increased distance from the first button
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AuthScreen()), // Navigate to the Role page
                );
              },
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'BalooBhai2', // Using Baloo Bhai 2 font
                  fontSize: 20, // Adjust font size as needed
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                minimumSize: Size(buttonWidth, 46),
                backgroundColor: Color.fromARGB(255, 97, 222, 236),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
