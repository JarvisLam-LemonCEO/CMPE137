import 'package:flutter/material.dart';

class ChangePasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change Password',
          style: TextStyle(color: Colors.black,
          fontSize: 30),
        ),
        backgroundColor: const Color(0xFF91E1DB), // Set background color of the app bar
      ),
      backgroundColor: const Color(0xFF91E1DB), // Set background color of the scaffold body
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Current Password',
                labelStyle: TextStyle(color: Colors.black),
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
              ),
              style: TextStyle(color: Colors.black),
              obscureText: true,
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'New Password',
                labelStyle: TextStyle(color: Colors.black),
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
              ),
              style: TextStyle(color: Colors.black),
              obscureText: true,
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Confirm New Password',
                labelStyle: TextStyle(color: Colors.black),
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
              ),
              style: TextStyle(color: Colors.black),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement logic to change password
              },
              child: Text('Submit', style: TextStyle(color: Colors.black,
              fontFamily: 'BalooBhai2',
              fontSize: 20)),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFFFFF), // Set button background color to match app bar
              ),
            ),
          ],
        ),
      ),
    );
  }
}
