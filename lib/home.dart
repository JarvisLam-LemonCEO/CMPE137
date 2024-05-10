import 'package:flutter/material.dart';
import 'hello.dart'; // Import your hello.dart file
import 'vendorManageAccount.dart';
import 'vendorPaymentInfo.dart';
import 'vendorNotifications.dart';
import 'vendorPrivacy.dart';
import 'newsUpdatesView.dart'; // Import the NewsUpdatesViewPage
//import 'addNewsUpdate.dart'; // Import the AddNewsUpdates
import 'itemListView.dart'; // Import the itemListView.dart file
import 'addItem.dart'; // Import the AddItemPage
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final List<String> _tabTitles = [
    'Home',
    'News Update',
    'Order',
    'Profile',
  ];

  bool _isLogoutVisible = false;
  List<DocumentSnapshot> _items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            _tabTitles[_selectedIndex],
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'BalooBhai2',
              fontSize: 30 // Set the text color to white
            ),
          ),
        ),
        backgroundColor: Color(0xFFC39ADC),
      ),
      backgroundColor: Color(0xFFC39ADC),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (_selectedIndex == 0 && _items.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Text(
                    'Item Availability',
                    style: TextStyle(color: Colors.black, fontSize: 24 ,fontFamily: 'BalooBhai2',
                  ),
                  ),
                ),
              SizedBox(height: 10),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: _fetchItems, // Call _fetchItems when refreshing
                  child: _selectedIndex == 0 && _items.isNotEmpty
                      ? ListView.builder(
                          itemCount: _items.length,
                          itemBuilder: (context, index) {
                            final item = _items[index];
                            final itemName = item['itemName'] ?? 'Item Name';
                            final description = item['description'] ?? 'Item Description';
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ItemListView(item: item)),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      itemName,
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      description,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      : _selectedIndex == 1
                          ? Padding(
                              padding: EdgeInsets.only(top: 40), // Add padding to the top of the list view
                              child: NewsUpdatesView(), // Show the NewsUpdatesViewPage
                            )
                          : _selectedIndex == 3
                              ? Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Manage account button
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => ManageAccountPage()),
                                          );
                                        },
                                        child: Text(
                                          'Manage Account',
                                          style: TextStyle(color: Colors.black, fontFamily: 'BalooBhai2',
                  fontSize: 20),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFF91E1DB),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          minimumSize: Size(200, 50),
                                        ),
                                      ),
                                      // payment information button
                                      SizedBox(height: 20),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => PaymentInformationPage()),
                                          );
                                        },
                                        child: Text(
                                          'Payment Information',
                                          style: TextStyle(color: Colors.black, fontFamily: 'BalooBhai2',
                  fontSize: 20),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFF91E1DB),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          minimumSize: Size(200, 50),
                                        ),
                                      ),

                                      // notifications button
                                      SizedBox(height: 20),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => NotificationsPage()),
                                          );
                                        },
                                        child: Text(
                                          'Notifications',
                                          style: TextStyle(color: Colors.black, fontFamily: 'BalooBhai2',
                  fontSize: 20),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFF91E1DB),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          minimumSize: Size(200, 50),
                                        ),
                                      ),
                                      // privacy buttons
                                      SizedBox(height: 20),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => PrivacyPage()),
                                          );
                                        },
                                        child: Text(
                                          'Privacy',
                                          style: TextStyle(color: Colors.black, fontFamily: 'BalooBhai2',
                  fontSize: 20),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFF91E1DB),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          minimumSize: Size(200, 50),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Container(), // If another tab is selected, show an empty container
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedFontSize: 15,
        selectedItemColor: Color(0xFFC39ADC), // Light blue color for selected item
        unselectedItemColor: Colors.grey, // Gray color for unselected item
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'News Update',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      floatingActionButton: Stack(
        children: [
          // Logout button
          _selectedIndex == 3 && _isLogoutVisible
              ? AnimatedOpacity(
                  opacity: _isLogoutVisible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const HelloPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Log out',
                          style: TextStyle(color: Colors.white, fontFamily: 'BalooBhai2',
                  fontSize: 20),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                )
              : SizedBox(), // Placeholder to maintain layout when logout button is not visible
          // Add item button
          _selectedIndex == 0
              ? FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddItemPage()), // Navigate to AddItemPage
                    );
                  },
                  backgroundColor: Color(0xFFEADDFF), // Set button background color
                  child: Icon(Icons.add), // Add icon to button
                )
              : SizedBox(), // Placeholder to maintain layout when add item button is not visible
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _fetchItems();
  }

  Future<void> _fetchItems() async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('items').get();
    setState(() {
      _items = snapshot.docs;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _isLogoutVisible = index == 3;
    });
  }
}
