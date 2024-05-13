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
  late Stream<List<ConnectivityResult>> _connectivityStream;
  late bool isOffline;

  @override
  void initState() {
    super.initState();
    _connectivity = Connectivity();
    _connectivityStream = _connectivity.onConnectivityChanged;
    _updateConnectionStatus();
  }

  Future<void> _updateConnectionStatus() async {
    var result = await _connectivity.checkConnectivity();
    _handleConnectivityResult(result);
  }

  void _handleConnectivityResult(List<ConnectivityResult> results) {
    var result = results.isNotEmpty ? results.first : ConnectivityResult.none;
    setState(() {
      isOffline = result != ConnectivityResult.wifi && result != ConnectivityResult.mobile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ConnectivityResult>>(
      stream: _connectivityStream,
      initialData: [ConnectivityResult.none],
      builder: (context, snapshot) {
        var results = snapshot.data!;
        _handleConnectivityResult(results); // Update connection status whenever stream emits a new result
        return widget.child;
      },
    );
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
    return Text('Your main content');
  }
}
