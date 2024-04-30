import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'role.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized()
  if(kIsWeb){
    await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCZb7ZjqVeM9aYDQMTwV-Mm0MTX7Ck1uZg",
  authDomain: "streeteats-6ddb2.firebaseapp.com",
  projectId: "streeteats-6ddb2",
  storageBucket: "streeteats-6ddb2.appspot.com",
  messagingSenderId: "462044370321",
  appId: "1:462044370321:web:a90b7de0b70b15cb8fb630"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
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
