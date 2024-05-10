

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ItemListView extends StatefulWidget {
  final DocumentSnapshot item;

  const ItemListView({Key? key, required this.item}) : super(key: key);

  @override
  _ItemListViewState createState() => _ItemListViewState();
}

class _ItemListViewState extends State<ItemListView> {
  late TextEditingController _itemNameController;
  late TextEditingController _priceController;
  late TextEditingController _quantityController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _itemNameController = TextEditingController(text: widget.item['itemName']);
    _priceController = TextEditingController(text: widget.item['price']);
    _quantityController = TextEditingController(text: widget.item['quantity']);
    _descriptionController = TextEditingController(text: widget.item['description']);
  }

  @override
  void dispose() {
    _itemNameController.dispose();
    _priceController.dispose();
    _quantityController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Item Detail',
          style: TextStyle(color: Colors.white, 
          fontFamily: 'BalooBhai2', fontSize: 30),
        ),
        backgroundColor: Color(0xFFC39ADC),
      ),
      backgroundColor: Color(0xFFC39ADC),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
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
              controller: _itemNameController,
              decoration: InputDecoration(
                labelText: 'Item Name',
                labelStyle: TextStyle(color: Colors.white, fontFamily: 'BalooBhai2'),
              ),
              style: TextStyle(color: Colors.white),
            ),
            TextFormField(
              controller: _priceController,
              decoration: InputDecoration(
                labelText: 'Price',
                labelStyle: TextStyle(color: Colors.white, fontFamily: 'BalooBhai2'),
              ),
              style: TextStyle(color: Colors.white),
            ),
            TextFormField(
              controller: _quantityController,
              decoration: InputDecoration(
                labelText: 'Quantity',
                labelStyle: TextStyle(color: Colors.white, fontFamily: 'BalooBhai2'),
              ),
              style: TextStyle(color: Colors.white),
            ),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Item Description',
                labelStyle: TextStyle(color: Colors.white, fontFamily: 'BalooBhai2'),
              ),
              maxLines: null,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _updateItem();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF91E1DB),
                  ),
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.black, fontFamily: 'BalooBhai2' ,fontSize: 20),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _showDeleteConfirmationDialog();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: Text(
                    'Delete',
                    style: TextStyle(color: Colors.white, fontFamily: 'BalooBhai2', fontSize: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _updateItem() {
    FirebaseFirestore.instance.collection('items').doc(widget.item.id).update({
      'itemName': _itemNameController.text,
      'price': _priceController.text,
      'quantity': _quantityController.text,
      'description': _descriptionController.text,
    }).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item updated successfully')));
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to update item: $error')));
    });
  }

  void _showDeleteConfirmationDialog() {
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
                _deleteItem();
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
  }

  void _deleteItem() {
    FirebaseFirestore.instance.collection('items').doc(widget.item.id).delete().then((value) {
      Navigator.of(context).pop(); // Close dialog
      Navigator.of(context).pop(); // Close ItemListView
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item deleted successfully')));
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to delete item: $error')));
    });
  }
}
