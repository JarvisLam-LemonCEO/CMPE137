
import 'package:flutter/material.dart';
import 'package:flutter_tut/radar.dart';
import 'hello.dart';
import 'vendorNews.dart';
import 'manageAccount.dart';
import 'paymentInfo.dart';
import 'notifications.dart';
import 'privacy.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerHome extends StatefulWidget {
  const CustomerHome({Key? key}) : super(key: key);

  @override
  State<CustomerHome> createState() => _CustomerHomeState();
}

class _CustomerHomeState extends State<CustomerHome> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<String> _tabTitles = [
    'Home',
    'Vendor Radar',
    'Order',
    'Profile',
  ];

  bool _isLogoutVisible = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Disable swipe gesture
      onHorizontalDragUpdate: (_) {},
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFF91E1DB),
          title: Text(
            _tabTitles[_selectedIndex],
            style: TextStyle(
              fontFamily: 'BalooBhai2',
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
actions: [
  if (_selectedIndex == 0) // Only show the refresh button on the home page
    IconButton(
      onPressed: () {
        // Implement your refresh logic here
        print('Refreshing vendor news...');
        setState(() {});
      },
      icon: Icon(
        Icons.refresh,
        color: Colors.white, // Set the color of the refresh button to white
      ),
    ),
],

        ),
        body: Container(
          color: Color(0xFF91E1DB),
          child: _selectedIndex == 0
              ? HomeListView(onVendorNewsClicked: (title, details) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VendorNewsPage(title: title, details: details),
                    ),
                  );
                })
              : _selectedIndex == 1
                  ? Vardar()
                  : _selectedIndex == 2
                      ? Container(
                          color: const Color(0xFF91E1DB),
                        )
                      : _selectedIndex == 3
                          ? Container(
                              color: Color(0xFF91E1DB),
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
                                      child: Text('Manage Account', 
                                      style: TextStyle(color: Colors.black,
                                      fontFamily: 'BalooBhai2',
                                      fontSize: 20
                                     )),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFFFFFFFF),
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
                                      child: Text('Payment Information', style: TextStyle(color: Colors.black,
                                      fontFamily: 'BalooBhai2',
                                      fontSize: 20)),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFFFFFFFF),
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
                                      child: Text('Notifications', style: TextStyle(color: Colors.black,
                                      fontFamily: 'BalooBhai2',
                                      fontSize: 20)),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFFFFFFFF),
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
                                      child: Text('Privacy', style: TextStyle(color: Colors.black,
                                      fontFamily: 'BalooBhai2',
                                      fontSize: 20)),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFFFFFFFF),
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

class HomeListView extends StatefulWidget {
  final Function(String title, String details) onVendorNewsClicked;

  const HomeListView({Key? key, required this.onVendorNewsClicked}) : super(key: key);

  @override
  _HomeListViewState createState() => _HomeListViewState();
}

class _HomeListViewState extends State<HomeListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('newsUpdates').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(
            child: Text('No vendor news available'),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            print('Refreshing...');
            setState(() {});
          },
          child: ListView.builder(
            controller: _scrollController,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final title = snapshot.data!.docs[index]['title'];
              final details = snapshot.data!.docs[index]['content']; // Assuming content field in Firestore contains details
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
        );
      },
    );
  }
}
