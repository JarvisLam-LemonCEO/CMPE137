import 'package:flutter/material.dart';
import 'vendorChangePassword.dart'; // Import the ChangePasswordPage
import 'vendorEditProfile.dart'; // Import the EditProfilePage
import 'editStore.dart'; // Import the EditStorePage

class ManageAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final buttonWidth = MediaQuery.of(context).size.width * 0.7; // Adjust the width as needed

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Manage Account',
          style: TextStyle(color: Colors.white), // Set title text color to white
        ),
        backgroundColor: const Color(0xFF0F8B7C), // Set background color of the app bar
      ),
      backgroundColor: const Color(0xFF0F8B7C), // Set background color of the scaffold body
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // User Profile Information
              Text(
                'Vendor Name',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              Text(
                'vendor@example.com',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(height: 20),

              // Business Information
              Text(
                'Business Information:',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              // Add widgets for displaying store details
              // For example:
              // Business Picture
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/business_image.jpg', // Replace with actual business image
                  width: 200, // Adjust width as needed
                  height: 150, // Adjust height as needed
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Business Name',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              Text(
                'Address',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              Text(
                'Type',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              Text(
                'Description',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              // Add more widgets for other store details like social links if needed

              SizedBox(height: 20),

              // Buttons for Changing Password, Editing Profile, and Editing Store
              SizedBox(
                width: buttonWidth,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to ChangePasswordPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChangePasswordPage()),
                    );
                  },
                  child: Text('Change Password', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0BC2AC), // Set button background color
                  ),
                ),
              ),
              SizedBox(height: 10), // Adjust the spacing between buttons
              SizedBox(
                width: buttonWidth,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to EditProfilePage
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditProfilePage()),
                    );
                  },
                  child: Text('Edit Profile', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0BC2AC), // Set button background color
                  ),
                ),
              ),
              SizedBox(height: 10), // Adjust the spacing between buttons
              SizedBox(
                width: buttonWidth,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to EditStorePage
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditStorePage()),
                    );
                  },
                  child: Text('Edit Store', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0BC2AC), // Set button background color
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
