import 'package:flutter/material.dart';

class AddItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Item',
          style: TextStyle(color: Colors.white), // Set title text color to white
        ),
        backgroundColor: Color(0xFF0F8B7C), // Set app bar background color
      ),
      backgroundColor: Color(0xFF0F8B7C), // Set scaffold background color
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                // Implement functionality to access phone album here
              },
              child: Container(
                width: double.infinity,
                height: 200,
                color: Colors.grey[300], // Set color of rectangular box
                child: Center(
                  child: Icon(
                    Icons.add_photo_alternate,
                    size: 50,
                    color: Colors.white, // Set color of icon to white
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Item Name',
                labelStyle: TextStyle(color: Colors.white), // Set label text color to white
              ),
              style: TextStyle(color: Colors.white), // Set text color to white
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Price',
                labelStyle: TextStyle(color: Colors.white), // Set label text color to white
              ),
              style: TextStyle(color: Colors.white), // Set text color to white
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Quantity',
                labelStyle: TextStyle(color: Colors.white), // Set label text color to white
              ),
              style: TextStyle(color: Colors.white), // Set text color to white
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Item Description',
                labelStyle: TextStyle(color: Colors.white), // Set label text color to white
              ),
              maxLines: null, // Allow multiple lines for description
              style: TextStyle(color: Colors.white), // Set text color to white
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Implement submit functionality here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0BC2AC), // Set button background color
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.black), // Set text color to black
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
