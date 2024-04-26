import 'package:flutter/material.dart';

class ItemListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Item Detail',
          style: TextStyle(color: Colors.white), // Set text color to white
        ),
        backgroundColor: Color(0xFF0F8B7C), // Set title background color
      ),
      backgroundColor: Color(0xFF0F8B7C), // Set background color
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[300], // Set color of the box
                borderRadius: BorderRadius.circular(10), // Add border radius for rounded corners
              ),
              child: Center(
                child: Icon(
                  Icons.image, // Placeholder icon for image
                  size: 50,
                  color: Colors.white, // Set color of icon to white
                ),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Item Name',
                labelStyle: TextStyle(color: Colors.white), // Set label text color to white
              ),
              initialValue: 'Item Name', // Replace with actual item name
              style: TextStyle(color: Colors.white), // Set text color to white
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Price',
                labelStyle: TextStyle(color: Colors.white), // Set label text color to white
              ),
              initialValue: '10.00', // Replace with actual price
              style: TextStyle(color: Colors.white), // Set text color to white
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Quantity',
                labelStyle: TextStyle(color: Colors.white), // Set label text color to white
              ),
              initialValue: '5', // Replace with actual quantity
              style: TextStyle(color: Colors.white), // Set text color to white
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Item Description',
                labelStyle: TextStyle(color: Colors.white), // Set label text color to white
              ),
              initialValue: 'Item Description', // Replace with actual item description
              maxLines: null, // Allow multiple lines for description
              style: TextStyle(color: Colors.white), // Set text color to white
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Implement save functionality here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0BC2AC), // Set button color to 0xFF0BC2AC
                  ),
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.black), // Set text color to black
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Show delete confirmation dialog
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Confirm Delete'),
                          content: Text('Are you sure you want to delete this item?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close dialog
                              },
                              child: Text(
                                'Cancel',
                                style: TextStyle(color: Colors.blue), // Set text color to blue
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                // Implement delete functionality here
                                // Close dialog
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Delete',
                                style: TextStyle(color: Colors.red), // Set text color to red
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Set button color to red
                  ),
                  child: Text(
                    'Delete',
                    style: TextStyle(color: Colors.white), // Set text color to white
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
