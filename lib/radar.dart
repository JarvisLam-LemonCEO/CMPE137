// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'vendorInfo.dart';

// class Vardar extends StatefulWidget {
//   const Vardar({Key? key});

//   @override
//   _VardarState createState() => _VardarState();
// }

// class _VardarState extends State<Vardar> {
//   late final ListOfVendors allVendors;

//   @override 
//   void initState(){
//     super.initState();
//     allVendors = ListOfVendors();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(0), // Set appBar height to 0
//         child: AppBar(
//           automaticallyImplyLeading: false, // Set automaticallyImplyLeading to false
//           // backgroundColor: const Color.fromRGBO(222, 173, 0, 100),
//           // centerTitle: true,
//           // title: const Text('Vendor Locator'),
//         ),
//       ),
//       body: GoogleMap(
//         onMapCreated: _onMapCreated,
//         initialCameraPosition: CameraPosition(
//           target: allVendors.vendors.first.location,
//           zoom: 15.0,
//         ),
//         markers: allVendors.vendors.map((vendors){
//           return Marker(
//             markerId: MarkerId(vendors.name),
//             position: vendors.location,
//             infoWindow: InfoWindow(
//               title: vendors.name,
//               snippet: vendors.rating,
//             ),
//           );
//         }).toSet(),
//       ),
//     );
//   }

//   void _onMapCreated(GoogleMapController controller) {
//     // Use the controller for map functionalities
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'vendorInfo.dart';

class Vardar extends StatefulWidget {
  const Vardar({Key? key});

  @override
  _VardarState createState() => _VardarState();
}

class _VardarState extends State<Vardar> {
  late final ListOfVendors allVendors;
  late GoogleMapController _mapController;
  LatLng _currentLocation = LatLng(37.7749, -122.4194); // Default location set to San Francisco

  @override
  void initState(){
    super.initState();
    allVendors = ListOfVendors();
    _getCurrentLocation(); // Retrieve the user's current location when the widget initializes
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      bool serviceStatus = await Geolocator.openLocationSettings();
      if (!serviceStatus) {
        // Location service is not enabled and the user declined to enable it
        return;
      }
    }

    // Request permission to access the device's location
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permission was denied, handle accordingly
      return;
    }

    // Get the device's current position
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    setState(() {
      _currentLocation = LatLng(position.latitude, position.longitude); // Set the current location to the user's real-time location
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0), // Set appBar height to 0
        child: AppBar(
          automaticallyImplyLeading: false, // Set automaticallyImplyLeading to false
          // backgroundColor: const Color.fromRGBO(222, 173, 0, 100),
          // centerTitle: true,
          // title: const Text('Vendor Locator'),
        ),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _currentLocation, // Set the initial camera position to the user's real-time location
          zoom: 15.0,
        ),
        markers: allVendors.vendors.map((vendors){
          return Marker(
            markerId: MarkerId(vendors.name),
            position: vendors.location,
            infoWindow: InfoWindow(
              title: vendors.name,
              snippet: vendors.rating,
            ),
          );
        }).toSet(),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    // Use the controller for map functionalities
  }
}
