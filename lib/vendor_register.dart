import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_tut/vendorSigningUp.dart';
import 'auth_screen.dart'; // Import the Auth class for Firebase authentication

class VendorRegisterPage extends StatelessWidget {
  final String vendorID; // Vendor ID passed from Role.dart
  final Auth auth = Auth(); // Initialize the Auth class

  VendorRegisterPage({Key? key, required this.vendorID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFFDEAD00), // Set the background color to DEAD00
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 4, 122, 254), // Back arrow color
          ),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page (HelloPage)
          },
        ),
        title: Text(
          'Join as a Vendor',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFFDEAD00), // Set the background color to DEAD00
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: screenSize.width * 0.5,
                height: screenSize.width * 0.5,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey),
                ),
                child: Icon(Icons.person, size: 50),
              ),
              SizedBox(height: 20),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  contentPadding: EdgeInsets.all(15),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  contentPadding: EdgeInsets.all(15),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  contentPadding: EdgeInsets.all(15),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  contentPadding: EdgeInsets.all(15),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  // Check if all input fields are filled
                  if (nameController.text.isEmpty ||
                      emailController.text.isEmpty ||
                      passwordController.text.isEmpty) {
                    // Show a red error message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Please fill in all fields',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    );
                  } else {
                    // Get text field values
                    String name = nameController.text;
                    String email = emailController.text;
                    String password = passwordController.text;

                    // Create user account with Firebase authentication
                    try {
                      await auth.createUserWithEmailAndPassword(email: email, password: password);

                      // Add user data to Firestore
                      await FirebaseFirestore.instance.collection('vendors').doc(vendorID).set({
                        'name': name,
                        'email': email,
                        // Add more fields as needed
                      });

                      // Navigate to the VendorSigningUpPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VendorSigningUpPage(vendorID: vendorID)),
                      );
                    } catch (e) {
                      // Handle errors
                      print('Error registering user: $e');
                    }
                  }
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 14, 122, 254),
                  minimumSize: Size(171, 46),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
