import 'package:flutter/material.dart';

class PaymentInformationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Information',
        style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xFF0F8B7C), // Set background color of the app bar
      ),
      backgroundColor: const Color(0xFF0F8B7C), // Set background color of the scaffold body
      body: Center(
        child: Text(
          'This is the Payment Information Page',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}
