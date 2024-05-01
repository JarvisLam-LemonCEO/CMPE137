import 'package:flutter/material.dart';
import 'vendorStoreSetUp.dart';

class VendorSignUpCompletePage extends StatelessWidget {
  final String vendorID; // Add vendorID field

  const VendorSignUpCompletePage({Key? key, required this.vendorID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Simulate a delay of 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      // Navigate to the VendorStoreSetUpPage and pass vendorID
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => VendorStoreSetUpPage(vendorID: vendorID)), // Pass vendorID
      );
    });

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
