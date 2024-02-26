import 'package:flutter/material.dart';

class VendorSignUpComplete extends StatelessWidget {
  const VendorSignUpComplete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
