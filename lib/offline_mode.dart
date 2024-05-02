import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class OfflineDetector extends StatefulWidget {
  final Widget child;

  OfflineDetector({required this.child});

  @override
  _OfflineDetectorState createState() => _OfflineDetectorState();
}

class _OfflineDetectorState extends State<OfflineDetector> {
  late Connectivity _connectivity;
  late bool isOffline;

  @override
  void initState() {
    super.initState();
    _connectivity = Connectivity();
    _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      _updateConnectionStatus(result);
    });
    _updateConnectionStatus();
  }

  Future<void> _updateConnectionStatus([ConnectivityResult? result]) async {
    if (result == null) {
      result = await _connectivity.checkConnectivity();
    }
    setState(() {
      isOffline = result != ConnectivityResult.wifi && result != ConnectivityResult.mobile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

void main() {
  runApp(
    OfflineDetector(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Your App'),
        ),
        body: Center(
          child: _MyAppBody(),
        ),
      ),
    );
  }
}

class _MyAppBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _getIsOffline(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Loading indicator while checking connectivity
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final bool isOffline = snapshot.data!;
          return isOffline ? Text('You are offline') : Text('Your main content');
        }
      },
    );
  }

  Future<bool> _getIsOffline() async {
    ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.wifi && connectivityResult != ConnectivityResult.mobile;
  }
}
