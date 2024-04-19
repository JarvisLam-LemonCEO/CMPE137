import 'package:flutter/material.dart';
import 'hello.dart'; // Import your hello.dart file
import 'vendorManageAccount.dart';
import 'vendorPaymentInfo.dart';
import 'vendorNotifications.dart';
import 'vendorPrivacy.dart';
import 'newsUpdatesView.dart'; // Import the NewsUpdatesViewPage
import 'addNewsUpdate.dart'; // Import the AddNewsUpdates

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
            Container(
              color: Color(0xFF0F8B7C), // Set the background color of the body
              child: _selectedIndex == 1 // Check if the News Update tab is selected
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
                                  style: TextStyle(color: Colors.black),
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
                                  style: TextStyle(color: Colors.black),
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
                                  style: TextStyle(color: Colors.black),
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
                                  style: TextStyle(color: Colors.black),
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
        floatingActionButton: _selectedIndex == 3 // Only show the button on the Profile tab
            ? AnimatedOpacity(
                opacity: _isLogoutVisible ? 1.0 : 0.0,
                duration: Duration(milliseconds: 500),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HelloPage()),
                        );
                      },
                      child: Text(
                        'Log out',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              )
            : null, // If another tab is selected, hide the button
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
