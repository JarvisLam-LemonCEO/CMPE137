import 'package:flutter/material.dart';
import 'home.dart'; // Import your customerHome.dart file


class StoreSetUpComplete extends StatefulWidget {
  const StoreSetUpComplete({Key? key}) : super(key: key);

  @override
  _StoreSetUpCompleteState createState() => _StoreSetUpCompleteState();
}

class _StoreSetUpCompleteState extends State<StoreSetUpComplete> {
  @override
  void initState() {
    super.initState();
    
    // Delay the navigation to the SignUpCompletePage by 2 seconds
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle, // Display the check mark icon
                color: Colors.green, // Set the color of the icon
                size: 100, // Set the size of the icon
              ),
              SizedBox(height: 16), // Add some space
              Text(
                'Store Setup Complete', // Display the text "Store Setup Complete"
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 14, 122, 254)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
