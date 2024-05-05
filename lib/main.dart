import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
 );

  // Check network connectivity when the app starts
  await checkConnectivity();

  runApp(const MyApp());
}

// check connectivity
Future<void> checkConnectivity() async {
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
      initialRoute: '/splash', // Set initialRoute to point to the splash screen
      routes: {

        '/splash': (context) => SplashScreen(), // Route for the splash screen
      },
      theme: ThemeData(
        fontFamily: 'SF Pro Display', // Set the default font family to SF Pro Display
      ),
    );
  }
}


