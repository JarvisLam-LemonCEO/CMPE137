
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'vendorChangePassword.dart';
import 'vendorEditProfile.dart';
import 'editStore.dart';
import 'store_details.dart';

class ManageAccountPage extends StatefulWidget {
  @override
  _ManageAccountPageState createState() => _ManageAccountPageState();
}

class _ManageAccountPageState extends State<ManageAccountPage> {
  late StoreDetails storeDetails;
  User? user; // Initialize with nullable type

  @override
  void initState() {
    super.initState();
    // Initialize store details with dummy data
    storeDetails = StoreDetails(
      businessName: 'My Business',
      address: '123 Main St',
      type: 'Retail',
      description: 'Description of my business',
    );
    // Fetch the current user
    user = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    final buttonWidth = MediaQuery.of(context).size.width * 0.7;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Manage Account',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'BalooBhai2',
            fontSize: 30,
          ),
        ),
        backgroundColor: const Color(0xFFC39ADC),
      ),
      backgroundColor: const Color(0xFFC39ADC),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                user?.displayName ?? 'Vendor Name', // Use user?.displayName
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontFamily: 'BalooBhai2',
                ),
              ),
              Text(
                user?.email ?? 'vendor@example.com', // Use user?.email
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontFamily: 'BalooBhai2',
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Business Information:',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: 'BalooBhai2',
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/business_image.jpg', // Replace with actual business image
                  width: 200,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10),
              Text(
                storeDetails.businessName,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: 'BalooBhai2',
                ),
              ),
              Text(
                storeDetails.address,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: 'BalooBhai2',
                ),
              ),
              Text(
                storeDetails.type,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: 'BalooBhai2',
                ),
              ),
              Text(
                storeDetails.description,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: 'BalooBhai2',
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: buttonWidth,
                child: ElevatedButton(
                  onPressed: () async {
                    final updatedStoreDetails = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditStorePage(
                          initialBusinessName: storeDetails.businessName,
                          initialAddress: storeDetails.address,
                          initialType: storeDetails.type,
                          initialDescription: storeDetails.description,
                        ),
                      ),
                    );

                    if (updatedStoreDetails != null) {
                      setState(() {
                        storeDetails = StoreDetails(
                          businessName: updatedStoreDetails['businessName'],
                          address: updatedStoreDetails['address'],
                          type: updatedStoreDetails['type'],
                          description: updatedStoreDetails['description'],
                        );
                      });
                    }
                  },
                  child: Text('Edit Store', style: TextStyle(color: Colors.black, fontFamily: 'BalooBhai2', fontSize: 20)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF91E1DB),
                  ),
                ),
              ),
              SizedBox(height: 10),

              // Buttons for Changing Password, Editing Profile, and Editing Store
              SizedBox(
                width: buttonWidth,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to ChangePasswordPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChangePasswordPage()),
                    );
                  },
                  child: Text('Change Password', style: TextStyle(color: Colors.black, fontFamily: 'BalooBhai2', fontSize: 20)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF91E1DB), // Set button background color
                  ),
                ),
              ),
              SizedBox(height: 10), // Adjust the spacing between buttons
              SizedBox(
                width: buttonWidth,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to EditProfilePage
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditProfilePage()),
                    );
                  },
                  child: Text('Edit Profile', style: TextStyle(color: Colors.black, fontFamily: 'BalooBhai2', fontSize: 20)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF91E1DB), // Set button background color
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
