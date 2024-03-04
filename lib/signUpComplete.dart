import 'package:flutter/material.dart';
import 'customerHome.dart'; // Import your customerHome.dart file

class SignUpCompletePage extends StatefulWidget {
  const SignUpCompletePage({Key? key}) : super(key: key);

  @override
  _SignUpCompletePageState createState() => _SignUpCompletePageState();
}

class _SignUpCompletePageState extends State<SignUpCompletePage> {
  @override
  void initState() {
    super.initState();
    
    // Delay the navigation to the CustomerHome page by 2 seconds
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CustomerHome()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDEAD00), // Set the background color to DEAD00
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle, // Display the check mark icon
                color: Colors.green, // Set the color of the icon
                size: 100, // Set the size of the icon
              ),
              SizedBox(height: 16), // Add some space
              Text(
                'Complete', // Display the text "Complete"
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 14, 122, 254)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
