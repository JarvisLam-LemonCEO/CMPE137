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
    final TextEditingController confirmPasswordController = TextEditingController();
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
                controller: confirmPasswordController,
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
                  String name = nameController.text.trim();
                  String email = emailController.text.trim();
                  String password = passwordController.text;
                  String confirmPassword = confirmPasswordController.text;

                  // Check if all input fields are filled
                  if (name.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Please fill in all fields',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    );
                    return;
                  }

                  // Validate email format
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Invalid email format',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    );
                    return;
                  }

                  // Check if password is at least 6 characters long
                  if (password.length < 6) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Password must have 6 characters or more',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    );
                    return;
                  }

                  // Check if password and confirm password match
                  if (password != confirmPassword) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Passwords do not match',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    );
                    return;
                  }

                  // Check if email has already been registered
                  QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('vendors').where('email', isEqualTo: email).get();
                  if (querySnapshot.docs.isNotEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Email already registered',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    );
                    return;
                  }

                  try {
                    // Create user account with Firebase authentication
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
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'The email has already registered. Try another email!',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    );
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
