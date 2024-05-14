import 'package:flutter/material.dart';

// vendor new on home page
class VendorNewsPage extends StatelessWidget {
  final String title;
  final String details;

  const VendorNewsPage({Key? key, required this.title, required this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(color: Colors.black, 
          fontFamily: 'BalooBhai2',
          fontSize: 30), // Set title color to white
        ),
        backgroundColor: const Color(0xFF91E1DB), // Set background color of the app bar
      ),
      backgroundColor: const Color(0xFF91E1DB), // Set background color of the scaffold body
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black), // Set text color
            ),
            SizedBox(height: 16),
            Text(
              details,
              style: TextStyle(fontSize: 18, color: Colors.black), // Set text color
            ),
          ],
        ),
      ),
    );
  }
}

