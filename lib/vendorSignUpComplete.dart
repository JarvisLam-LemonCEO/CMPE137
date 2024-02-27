import 'package:flutter/material.dart';
import 'vendorStoreSetUp.dart';

class VendorSignUpCompletePage extends StatelessWidget {
  const VendorSignUpCompletePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Simulate a delay of 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      // Navigate to the VendorStoreSetUpPage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => VendorStoreSetUpPage()),
      );
    });

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
