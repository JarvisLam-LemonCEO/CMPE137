import 'package:flutter/material.dart';
import 'hello.dart'; // Import your hello.dart file
import 'vendorManageAccount.dart';
import 'vendorPaymentInfo.dart';
import 'vendorNotifications.dart';
import 'vendorPrivacy.dart';
import 'newsUpdatesView.dart'; // Import the NewsUpdatesViewPage
import 'addNewsUpdate.dart'; // Import the AddNewsUpdates
import 'itemListView.dart'; // Import the itemListView.dart file
import 'addItem.dart'; // Import the AddItemPage

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 30), // Set the title color to white and font size to 30
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // Remove the back button
          title: Center(
            child: Text(_tabTitles[_selectedIndex]), // Title text
          ),
          backgroundColor: Color(0xFF0F8B7C), // Set background color of the app bar
        ),
        backgroundColor: Color(0xFF0F8B7C), // Set background color of the scaffold body
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (_selectedIndex == 0) // Only show the title on the Home page
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Text(
                      'Item Availability', // Title for item availability view list
                      style: TextStyle(color: Colors.white, fontSize: 24), // Text style for title
                    ),
                  ),
                SizedBox(height: 10),
                Expanded(
                  child: _selectedIndex == 0
                      ? ListView.builder(
                          itemCount: 10, // Replace with your actual item count
                          itemBuilder: (context, index) {
                            // Replace this container with your custom item widget
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ItemListView()), // Navigate to ItemListView
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('assets/item${index + 1}.jpg'), // Replace with asset image path
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Item Name', // Replace with actual item name
                                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            'Item Description', // Replace with actual item description
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ],
                                      ),
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
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFF0BC2AC),
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
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFF0BC2AC),
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
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFF0BC2AC),
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
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFF0BC2AC),
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
              ],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Color.fromARGB(255, 0, 122, 252), // Light blue color for selected item
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
                            style: TextStyle(color: Colors.white),
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
                    backgroundColor: Colors.green, // Set button background color
                    child: Icon(Icons.add), // Add icon to button
                  )
                : SizedBox(), // Placeholder to maintain layout when add item button is not visible
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _isLogoutVisible = index == 3;
    });
  }
}
