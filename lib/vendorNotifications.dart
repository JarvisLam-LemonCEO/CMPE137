import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool _notificationsEnabled = true; // Track the state of notifications

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(color: Colors.black,
          fontFamily: 'BalooBhai2',
          fontSize: 30),
        ),
        backgroundColor: const Color(0xFFC39ADC), // Set background color of the app bar
      ),
      backgroundColor: const Color(0xFFC39ADC), // Set background color of the scaffold body
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Notifications',
                  style: TextStyle(fontSize: 20, color: Colors.black,
                  fontFamily: 'BalooBhai2'),
                ),
                Switch(
                  value: _notificationsEnabled,
                  onChanged: (value) {
                    setState(() {
                      _notificationsEnabled = value;
                    });
                  },
                  activeColor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
