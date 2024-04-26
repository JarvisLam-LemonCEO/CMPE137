import 'package:flutter/material.dart';
import 'changePassword.dart'; // Import the ChangePasswordPage
import 'editProfile.dart'; // Import the EditProfilePage

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
        backgroundColor: const Color(0xFFDEAD00), // Set background color of the app bar
      ),
      backgroundColor: const Color(0xFFDEAD00), // Set background color of the scaffold body
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/profile_image.jpg'), // Replace with actual profile image
              ),
              SizedBox(height: 20),
              Text(
                'John Doe',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                'john.doe@example.com',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(height: 20),
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
                    backgroundColor: const Color(0xFFFFB200), // Set button background color to match app bar
                  ),
                ),
              ),
              SizedBox(height: 20),
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
                  child: Text('Change Profile Details', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFB200), // Set button background color to match app bar
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
