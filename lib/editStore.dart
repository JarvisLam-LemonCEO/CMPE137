import 'package:flutter/material.dart';

class EditStorePage extends StatefulWidget {
  @override
  _EditStorePageState createState() => _EditStorePageState();
}

class _EditStorePageState extends State<EditStorePage> {
  late TextEditingController _businessNameController;
  late TextEditingController _addressController;
  late TextEditingController _typeController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _businessNameController = TextEditingController();
    _addressController = TextEditingController();
    _typeController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _businessNameController.dispose();
    _addressController.dispose();
    _typeController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Store',
          style: TextStyle(color: Colors.black,
          fontFamily: 'BalooBhai2',
          fontSize: 30), // Set title text color to white
        ),
        backgroundColor: const Color(0xFFC39ADC), // Set background color of the app bar
      ),
      backgroundColor: const Color(0xFFC39ADC), // Set background color of the scaffold body
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Edit Store Details Title
            Text(
              'Edit Store Details',
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
            SizedBox(height: 20),
            // Business Name Field
            TextFormField(
              controller: _businessNameController,
              decoration: InputDecoration(
                labelText: 'Business Name',
                labelStyle: TextStyle(color: Colors.black),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 20),
            // Address Field
            TextFormField(
              controller: _addressController,
              decoration: InputDecoration(
                labelText: 'Address',
                labelStyle: TextStyle(color: Colors.black),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 20),
            // Type Field
            TextFormField(
              controller: _typeController,
              decoration: InputDecoration(
                labelText: 'Type',
                labelStyle: TextStyle(color: Colors.black),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 20),
            // Description Field
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                labelStyle: TextStyle(color: Colors.black),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 20),
            // Center the Save Changes Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle saving changes
                },
                child: Text('Save Changes', style: TextStyle(color: Colors.black,
                fontFamily: 'BalooBhai2',
                fontSize: 20)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF91E1DB), // Set button background color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
