import 'package:flutter/material.dart';
import 'vendor_register.dart'; // Import VendorRegisterPage
import 'customer_register.dart'; // Import CustomerRegisterPage

class Role extends StatelessWidget {
  const Role({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 14, 122, 254), // Back arrow color
          ),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page (HelloPage)
          },
        ),
        title: Text(
          'Welcome to [our APP]',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black, // Title text color
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white, // App bar background color
        elevation: 0, // Remove app bar shadow
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Join our vibrant community of street vendors and customers. Whether you\'re looking to sell your unique creations or discover local treasures, choose your role below and start your journey today!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black, // Description text color
              ),
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VendorRegisterPage()), // Navigate to the VendorRegisterPage
                );
              },
              child: Text(
                'Join as a Vendor',
                style: TextStyle(
                  fontSize: 30, // Set font size to 30
                  color: Colors.white, // Button text color
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 14, 122, 254), // Button color
                minimumSize: Size(screenSize.width * 0.85, 200), // Button width and height
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Button border radius
                ),
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CustomerRegisterPage()), // Navigate to the CustomerRegisterPage
                );
              },
              child: Text(
                'Explore as a Customer',
                style: TextStyle(
                  fontSize: 30, // Set font size to 30
                  color: Colors.white, // Button text color
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 3, 216, 88), // Button color
                minimumSize: Size(screenSize.width * 0.85, 200), // Button width and height
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Button border radius
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
