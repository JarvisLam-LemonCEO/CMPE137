import 'package:flutter/material.dart';
import 'storeSetUpComplete.dart';

class StoreSetUpLoad extends StatefulWidget {
  const StoreSetUpLoad({Key? key}) : super(key: key);

  @override
  _StoreSetUpLoadState createState() => _StoreSetUpLoadState();
}

class _StoreSetUpLoadState extends State<StoreSetUpLoad> {
  @override
  void initState() {
    super.initState();
    // Delay the navigation to the home page by 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => StoreSetUpComplete()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF9DD7), // Set the background color to DEAD00
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Color(0xFF91E1DB),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Setting Up...',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF91E1DB),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
