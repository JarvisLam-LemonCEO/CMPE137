import 'package:flutter/material.dart';
import 'hello.dart'; // Import your hello.dart file

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
        automaticallyImplyLeading: false, // Remove the back button
        title: Text(_tabTitles[_selectedIndex]),
      ),
      body: _selectedIndex == 3 // Check if the profile tab is selected
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Add your profile tab's content here
              ],
            )
          : Container(), // If another tab is selected, show an empty container
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
                      primary: Colors.red,
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
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _isLogoutVisible = index == 3;
    });
  }
}
