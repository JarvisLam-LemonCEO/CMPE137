import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'role.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

void main() {
  runApp(MyApp());
   // Check network connectivity when the app starts
  checkConnectivity();
}

// check connectivity
void checkConnectivity() async {
  var connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult == ConnectivityResult.mobile) {
    print('Mobile data connection available');
  } else if (connectivityResult == ConnectivityResult.wifi) {
    print('WiFi connection available');
  } else {
    print('No active network connection');
  }
}


class MyApp extends StatelessWidget { 
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/role': (context) => Role(),

      },
      theme: ThemeData(
        fontFamily: 'SF Pro Display', // Set the default font family to SF Pro Display
      ),
    );
  }
}
