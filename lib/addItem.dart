import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController itemNameController = TextEditingController();
    final TextEditingController priceController = TextEditingController();
    final TextEditingController quantityController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    void submitItem() async {
      // Get text field values
      String itemName = itemNameController.text;
      String price = priceController.text;
      String quantity = quantityController.text;
      String description = descriptionController.text;

      // Add item data to Firestore
      try {
        await FirebaseFirestore.instance.collection('items').add({
          'itemName': itemName,
          'price': price,
          'quantity': quantity,
          'description': description,
        });

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Item added successfully'),
            backgroundColor: Colors.green,
          ),
        );

        // Clear text field values after submission
        itemNameController.clear();
        priceController.clear();
        quantityController.clear();
        descriptionController.clear();
      } catch (e) {
        // Handle errors
        print('Error adding item data to Firestore: $e');
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to add item'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Item',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF0F8B7C),
      ),
      backgroundColor: Color(0xFF0F8B7C),
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
                color: Colors.grey[300],
                child: Center(
                  child: Icon(
                    Icons.add_photo_alternate,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: itemNameController,
              decoration: InputDecoration(
                labelText: 'Item Name',
                labelStyle: TextStyle(color: Colors.white),
              ),
              style: TextStyle(color: Colors.white),
            ),
            TextFormField(
              controller: priceController,
              decoration: InputDecoration(
                labelText: 'Price',
                labelStyle: TextStyle(color: Colors.white),
              ),
              style: TextStyle(color: Colors.white),
            ),
            TextFormField(
              controller: quantityController,
              decoration: InputDecoration(
                labelText: 'Quantity',
                labelStyle: TextStyle(color: Colors.white),
              ),
              style: TextStyle(color: Colors.white),
            ),
            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'Item Description',
                labelStyle: TextStyle(color: Colors.white),
              ),
              maxLines: null,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: submitItem,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0BC2AC),
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
