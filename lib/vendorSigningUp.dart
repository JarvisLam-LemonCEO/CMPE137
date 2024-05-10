import 'package:flutter/material.dart';
import 'vendorSignUpComplete.dart';

class VendorSigningUpPage extends StatelessWidget {
  final String vendorID; // Add vendorID field

  const VendorSigningUpPage({Key? key, required this.vendorID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Simulate a delay of 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      // Navigate to the SignUpCompletePage and pass vendorID
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => VendorSignUpCompletePage(vendorID: vendorID)), // Pass vendorID
      );
    });

    return Scaffold(
      backgroundColor: Color(0xFFFF9DD7), // Set the background color to DEAD00
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Color(0xFF91E1DB),
                ),
              ), // Display the loading indicator
              SizedBox(height: 16), // Add some space
              Text(
                'Signing Up...',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color(0xFF91E1DB), fontFamily: 'BalooBhai'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
