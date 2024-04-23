import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy',
        style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xFFDEAD00), // Set background color of the app bar
      ),
      backgroundColor: const Color(0xFFDEAD00), // Set background color of the scaffold body
      body: Center(
        child: Text(
          'This is the Privacy Page',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}
