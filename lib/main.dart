import 'package:flutter/material.dart';
import 'splash_screen.dart'; // Import your splash screen widget
// import 'hello.dart';
import 'role.dart';

void main() {
  runApp(MyApp());
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
