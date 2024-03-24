import 'package:flutter/material.dart';
import 'signingup.dart'; // Import the SigningUpPage

class CustomerRegisterPage extends StatelessWidget {
  const CustomerRegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        title: Text('Explore as a Customer',
         style: TextStyle(
                      color: Colors.white,
                    ),),
              backgroundColor: Color(0xFFDEAD00), // Set the background color to DEAD00
      ),
      body: SingleChildScrollView( // Wrap the Scaffold in a SingleChildScrollView
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
              SizedBox(height: 20),
              // Sign Up button
              ElevatedButton(
                onPressed: () {
                  // Handle sign up button press
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SigningUpPage()),
                  );
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
