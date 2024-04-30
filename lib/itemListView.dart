import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ItemListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Item Detail',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF0F8B7C),
      ),
      backgroundColor: Color(0xFF0F8B7C),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('items').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
              return Center(
                child: Text('No items available'),
              );
            }

            // Extract data from snapshot and create list of items
            final List<DocumentSnapshot> items = snapshot.data!.docs;

            // For simplicity, display only the first item in the list
            final item = items.first;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.image,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Item Name',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  initialValue: item['itemName'],
                  style: TextStyle(color: Colors.white),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Price',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  initialValue: item['price'],
                  style: TextStyle(color: Colors.white),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Quantity',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  initialValue: item['quantity'],
                  style: TextStyle(color: Colors.white),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Item Description',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  initialValue: item['description'],
                  maxLines: null,
                  style: TextStyle(color: Colors.white),
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
                        backgroundColor: Color(0xFF0BC2AC),
                      ),
                      child: Text(
                        'Save',
                        style: TextStyle(color: Colors.black),
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
                                    style: TextStyle(color: Colors.blue),
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
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: Text(
                        'Delete',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
