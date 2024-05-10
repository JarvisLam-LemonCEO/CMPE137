import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'signingup.dart'; // Import the SigningUpPage

class CustomerRegisterPage extends StatelessWidget {
  final String customerID;

  const CustomerRegisterPage({Key? key, required this.customerID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController = TextEditingController();

    void signUp() async {
      String name = nameController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text;
      String confirmPassword = confirmPasswordController.text;

      // Check if name, email, and password are not empty
      if (name.isEmpty || email.isEmpty || password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please fill in all the fields.'),
            backgroundColor: Colors.red,
          ),
        );
        return; // Exit the function early
      }

      // Check if email is in valid format
      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Invalid email format.'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      // Check if password and confirm password match
      if (password != confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Passwords do not match.'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      // Check if password is at least 6 characters long
      if (password.length < 6) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Password should have 6 characters or more.'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      // Check if email already exists in Firebase
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
      } catch (e) {
        print('Error creating user: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Email already registered.'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      // User successfully created, navigate to the next page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SigningUpPage()),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xFFF6E8B6), // Set the background color to DEAD00
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 4, 122, 254), // Back arrow color
          ),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page (Role)
          },
        ),
        // title: Text(
        //   'Explore as a Customer',
        //   style: TextStyle(
        //     color: Colors.white,
        //   ),
        // ),
        backgroundColor: Color(0xFFF6E8B6), // Set the background color 
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Upload profile photo section
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
              // Name text field
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
              // Email text field
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
              // Password text field
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
              // Confirm Password text field
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
              SizedBox(height: 10),
              SizedBox(height: 20),
              // Sign Up button
              ElevatedButton(
                onPressed: signUp,
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
