import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'hello.dart'; // Import your hello.dart file
import 'vendorRadar.dart'; // Import your VendorRadar.dart file
=======
import 'hello.dart';
import 'vendorNews.dart';
import 'manageAccount.dart';
import 'paymentInfo.dart';
import 'notifications.dart';
import 'privacy.dart';
>>>>>>> f05fb346f76b290ee441fdc0fedbfea460ec3f2f

class CustomerHome extends StatefulWidget {
  const CustomerHome({Key? key}) : super(key: key);

  @override
  State<CustomerHome> createState() => _CustomerHomeState();
}

class _CustomerHomeState extends State<CustomerHome> {
  int _selectedIndex = 0;

  final List<String> _tabTitles = [
    'Home',
    'Vendor Radar',
    'Order',
    'Profile',
  ];

  bool _isLogoutVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFDEAD00),
        title: Text(
          _tabTitles[_selectedIndex],
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
<<<<<<< HEAD
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // Remove the back button
          title: Text(_tabTitles[_selectedIndex]),
          backgroundColor: const Color(0xFFDEAD00), // Set the background color of the app bar
        ),
        body: Container(
          color: const Color(0xFFDEAD00), // Set the background color of the body
          child: _selectedIndex == 1 // Check if the "Vendor Radar" tab is selected
              ? VendorRadar() // Show the VendorRadar widget
              : Container(), // If another tab is selected, show an empty container
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: const Color.fromARGB(255, 0, 122, 252), // Light blue color for selected item
          unselectedItemColor: Colors.grey, // Gray color for unselected item
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Vendor Radar',
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
=======
      body: _selectedIndex == 0
          ? HomeListView(onVendorNewsClicked: (title, details) {
              // Navigate to VendorNewsPage when a vendor news item is clicked
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VendorNewsPage(title: title, details: details),
                ),
              );
            })
          : _selectedIndex == 1 // Check if Vendor Radar tab is active
              ? Container(
                  color: const Color(0xFFDEAD00), // Set background color for Vendor Radar page
                )
              : _selectedIndex == 2 // Check if Order tab is active
                  ? Container(
                      color: const Color(0xFFDEAD00), // Set background color for Order page
                    )
                  : _selectedIndex == 3 // Check if Profile tab is active
                      ? Container(
                          color: Color(0xFFDEAD00), // Set the background color of the body
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ManageAccountPage()),
                                    );
                                  },
                                  child: Text('Manage Account', style: TextStyle(color: Colors.black)),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFFFFF00),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    minimumSize: Size(200, 50),
                                  ),
                                ),
                                SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => PaymentInformationPage()),
                                    );
                                  },
                                  child: Text('Payment Information', style: TextStyle(color: Colors.black)),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFFFFF00),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    minimumSize: Size(200, 50),
                                  ),
                                ),
                                SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => NotificationsPage()),
                                    );
                                  },
                                  child: Text('Notifications', style: TextStyle(color: Colors.black)),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFFFFF00),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    minimumSize: Size(200, 50),
                                  ),
                                ),
                                SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => PrivacyPage()),
                                    );
                                  },
                                  child: Text('Privacy', style: TextStyle(color: Colors.black)),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFFFFF00),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    minimumSize: Size(200, 50),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(), // If another tab is selected, show an empty container
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color.fromARGB(255, 0, 122, 252),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Vendor Radar',
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
      floatingActionButton: _selectedIndex == 3
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
>>>>>>> f05fb346f76b290ee441fdc0fedbfea460ec3f2f
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
          : null,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _isLogoutVisible = index == 3;
    });
  }
}

class HomeListView extends StatelessWidget {
  final Function(String title, String details) onVendorNewsClicked;

  const HomeListView({Key? key, required this.onVendorNewsClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFDEAD00),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              ),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Replace 10 with the actual number of items
              itemBuilder: (context, index) {
                final title = 'Vendor News ${index + 1}';
                final details = 'Details about Vendor News ${index + 1}';
                return ListTile(
                  title: Text(title),
                  subtitle: Text(details),
                  onTap: () {
                    onVendorNewsClicked(title, details);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
