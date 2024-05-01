import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'signingup.dart'; // Import the SigningUpPage

class CustomerRegisterPage extends StatelessWidget {
  final String customerID;

  const CustomerRegisterPage({Key? key, required this.customerID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    void signUp() async {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      // Check if email and password are not empty
      if (email.isEmpty || password.isEmpty) {
        // Show popup if email or password is empty
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Please fill in all the fields.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
        return; // Exit the function early
      }

      try {
        // Create user with email and password
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // User successfully created, you can now navigate to the next page or perform any other actions
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SigningUpPage()),
        );
      } catch (e) {
        // Handle sign up errors
        print('Error signing up: $e');
        // Show error message to the user if needed
      }
    }

    return Scaffold(
      backgroundColor: Color(0xFFDEAD00), // Set the background color to DEAD00
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
        title: Text(
          'Explore as a Customer',
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
