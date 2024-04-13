import 'package:flutter/material.dart';
import 'hello.dart';
import 'vendorRadar.dart';

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
        title: Text(_tabTitles[_selectedIndex]),
        backgroundColor: const Color(0xFFDEAD00),
      ),
      body: Container(
        color: const Color(0xFFDEAD00),
        child: _selectedIndex == 1
            ? Container() // Empty container since navigation to VendorRadar.dart is erased
            : Container(),
      ),
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

  if (index == 1) {
    // Navigate to VendorRadar screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => VendorRadar()),
    );
  }
}

}
