import 'package:flutter/material.dart';
import 'storeSetUpLoad.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VendorStoreSetUpPage extends StatelessWidget {
  const VendorStoreSetUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController businessNameController = TextEditingController();
    final TextEditingController businessAddressController = TextEditingController();
    final TextEditingController businessTypeController = TextEditingController();
    final TextEditingController businessDescriptionController = TextEditingController();
    final TextEditingController socialMediaLinkController = TextEditingController();
    final TextEditingController idProofController = TextEditingController();
    final TextEditingController paymentMethodController = TextEditingController();
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFFDEAD00),
      appBar: AppBar(
        title: Text(
          'Vendor Store Setup',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFFDEAD00),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: screenSize.width * 0.5,
                  height: screenSize.width * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      'Upload Cover Photo',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: businessNameController,
                  decoration: InputDecoration(
                    hintText: 'Business Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    contentPadding: EdgeInsets.all(15),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: businessAddressController,
                  decoration: InputDecoration(
                    hintText: 'Business Address',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    contentPadding: EdgeInsets.all(15),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: businessTypeController,
                  decoration: InputDecoration(
                    hintText: 'Business Type',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    contentPadding: EdgeInsets.all(15),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: businessDescriptionController,
                  decoration: InputDecoration(
                    hintText: 'Business Description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    contentPadding: EdgeInsets.all(15),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: socialMediaLinkController,
                  decoration: InputDecoration(
                    hintText: 'Social Media Link',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    contentPadding: EdgeInsets.all(15),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: idProofController,
                  decoration: InputDecoration(
                    hintText: 'ID Proof',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    contentPadding: EdgeInsets.all(15),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: paymentMethodController,
                  decoration: InputDecoration(
                    hintText: 'Payment Method',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    contentPadding: EdgeInsets.all(15),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    // Check if all text fields are filled
                    if (!_areAllFieldsFilled(
                        businessNameController.text,
                        businessAddressController.text,
                        businessTypeController.text,
                        businessDescriptionController.text,
                        socialMediaLinkController.text,
                        idProofController.text,
                        paymentMethodController.text)) {
                      // Show dialog if any field is empty
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Incomplete Form'),
                            content: Text('Please fill in all fields.'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      // All fields are filled, proceed to send data to Firestore
                      _sendDataToFirestore(
                        context,
                        businessNameController.text,
                        businessAddressController.text,
                        businessTypeController.text,
                        businessDescriptionController.text,
                        socialMediaLinkController.text,
                        idProofController.text,
                        paymentMethodController.text,
                      );
                    }
                  },
                  child: Text(
                    'Done',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 14, 122, 254),
                    minimumSize: Size(screenSize.width * 0.85, 46),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _areAllFieldsFilled(
    String businessName,
    String businessAddress,
    String businessType,
    String businessDescription,
    String socialMediaLink,
    String idProof,
    String paymentMethod,
  ) {
    return businessName.isNotEmpty &&
        businessAddress.isNotEmpty &&
        businessType.isNotEmpty &&
        businessDescription.isNotEmpty &&
        socialMediaLink.isNotEmpty &&
        idProof.isNotEmpty &&
        paymentMethod.isNotEmpty;
  }

  void _sendDataToFirestore(
    BuildContext context,
    String businessName,
    String businessAddress,
    String businessType,
    String businessDescription,
    String socialMediaLink,
    String idProof,
    String paymentMethod,
  ) async {
    // Add business data to Firestore
    try {
      await FirebaseFirestore.instance.collection('vendors').add({
        'businessName': businessName,
        'businessAddress': businessAddress,
        'businessType': businessType,
        'businessDescription': businessDescription,
        'socialMediaLink': socialMediaLink,
        'idProof': idProof,
        'paymentMethod': paymentMethod,
      });

      // Navigate to the next page or show success message
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => StoreSetUpLoad()),
      );
    } catch (e) {
      // Handle errors
      print('Error adding business data to Firestore: $e');
    }
  }
}
