import 'package:flutter/material.dart';
import 'signUpComplete.dart'; // Import the SignUpCompletePage

class SigningUpPage extends StatelessWidget {
  const SigningUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Simulate a delay of 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      // Navigate to the SignUpCompletePage
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignUpCompletePage()),
      );
    });

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(), // Display the loading indicator
              SizedBox(height: 16), // Add some space
              Text(
                'Signing Up...',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 14, 122, 254)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
