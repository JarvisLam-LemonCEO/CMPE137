import 'package:flutter/material.dart';
import 'hello.dart';
import 'vendorNews.dart';
import 'manageAccount.dart';
import 'paymentInfo.dart';
import 'notifications.dart';
import 'privacy.dart';

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
                                  child: Text('Manage Account', style: TextStyle(color: Colors.white)),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFFFB200),
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
                                  child: Text('Payment Information', style: TextStyle(color: Colors.white)),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFFFB200),
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
                                  child: Text('Notifications', style: TextStyle(color: Colors.white)),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFFFB200),
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
                                  child: Text('Privacy', style: TextStyle(color: Colors.white)),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFFFB200),
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

class HomeListView extends StatefulWidget {
  final Function(String title, String details) onVendorNewsClicked;

  const HomeListView({Key? key, required this.onVendorNewsClicked}) : super(key: key);

  @override
  _HomeListViewState createState() => _HomeListViewState();
}

class _HomeListViewState extends State<HomeListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    super.dispose();
  }

  Future<void> _onRefresh() async {
    // Implement your refresh logic here
    // For example, fetch new data from the server
  }

  void _onScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      // You have reached the bottom of the list view
      // Implement any additional logic if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: Container(
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
                controller: _scrollController,
                itemCount: 10, // Replace 10 with the actual number of items
                itemBuilder: (context, index) {
                  final title = 'Vendor News ${index + 1}';
                  final details = 'Details about Vendor News ${index + 1}';
                  return GestureDetector(
                    onTap: () {
                      widget.onVendorNewsClicked(title, details);
                    },
                    child: Card(
                      color: Colors.white,
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: ListTile(
                        title: Text(
                          title,
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          details,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}