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
      body: Container(
        color: Color(0xFFDEAD00), // Set the background color to DEAD00
        child: Stack(
          children: [
            Positioned(
              left: 20,
              top: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello',
                    style: TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Welcome to StreetEats',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Image.asset('assets/streetLogo.png',
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
                  ), backgroundColor: Color.fromARGB(255, 14, 122, 254),
                  minimumSize: Size(buttonWidth, 46),
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
                  backgroundColor: Color.fromARGB(255, 14, 122, 254),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
