import 'dart:math';
import 'package:flutter/material.dart';
import 'vendor_register.dart'; // Import VendorRegisterPage
import 'customer_register.dart'; // Import CustomerRegisterPage
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Role extends StatelessWidget {
  const Role({Key? key}) : super(key: key);

  Future<void> _registerVendor(BuildContext context) async {
    try {
      // Generate a unique vendorID
      String vendorID = _generateID();

      // Assuming you have obtained the user's role during registration
      String userRole = 'vendor'; // Set user role as 'vendor'

      // Get the current user
      User? user = FirebaseAuth.instance.currentUser;

      // Update user data in Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user?.uid)
          .set({'role': userRole, 'vendorID': vendorID}, SetOptions(merge: true)); // Merge with existing data if any

      // Navigate to the vendor registration page and pass the vendorID
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => VendorRegisterPage(vendorID: vendorID)), // Pass vendorID
      );
    } catch (e) {
      // Handle registration errors
      print('Error registering vendor: $e');
    }
  }

  Future<void> _registerCustomer(BuildContext context) async {
    try {
      // Generate a unique customerID
      String customerID = _generateID();

      // Assuming you have obtained the user's role during registration
      String userRole = 'customer'; // Set user role as 'customer'

      // Get the current user
      User? user = FirebaseAuth.instance.currentUser;

      // Update user data in Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user?.uid)
          .set({'role': userRole, 'customerID': customerID}, SetOptions(merge: true)); // Merge with existing data if any

      // Navigate to the customer registration page and pass the customerID
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CustomerRegisterPage(customerID: customerID)), // Navigate to CustomerRegisterPage
      );
    } catch (e) {
      // Handle registration errors
      print('Error registering customer: $e');
    }
  }

  String _generateID() {
    // Generate a unique ID using a combination of timestamp and random number
    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    String randomNumber = Random().nextInt(1000000).toString();
    return timestamp + randomNumber;
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFFDEAD00), // Set the background color to DEAD00
      appBar: AppBar(
        title: Text(
          'Select Role',
          style: TextStyle(
            color: Colors.white, // Title text color
          ),
        ),
        backgroundColor: Color(0xFFDEAD00), // Set the background color to DEAD00
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Join our vibrant community of street vendors and customers. Whether you\'re looking to sell your unique creations or discover local treasures, choose your role below and start your journey today!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white, // Description text color
                ),
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 20),
              SizedBox(height: 20), // Adjust the height between description and buttons
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => _registerVendor(context),
                      child: Text(
                        'Register as Vendor',
                        style: TextStyle(
                          fontSize: 30, // Set font size to 20
                          color: Colors.white, // Button text color
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 14, 122, 254), // Button color
                        minimumSize: Size(screenSize.width * 0.85, 200), // Button width and height
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30), // Button border radius
                        ),
                      ),
                    ),
                    SizedBox(height: 20), // Adjust the height between buttons
                    ElevatedButton(
                      onPressed: () => _registerCustomer(context),
                      child: Text(
                        'Register as Customer',
                        style: TextStyle(
                          fontSize: 30, // Set font size to 20
                          color: Colors.white, // Button text color
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 14, 122, 254), // Button color
                        minimumSize: Size(screenSize.width * 0.85, 200), // Button width and height
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30), // Button border radius
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
