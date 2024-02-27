import 'package:flutter/material.dart';
import 'hello.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delay the transition to the login page by 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HelloPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // Add this line
      body: SingleChildScrollView( // Wrap the Column widget in a SingleChildScrollView
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/Welcome.png'), // Display the Welcome.png image
              SizedBox(height: 16), // Add some space
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
