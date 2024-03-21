import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class VendorRadar extends StatefulWidget {
  const VendorRadar({Key? key}) : super(key: key);

  @override
  _VendorRadarState createState() => _VendorRadarState();
}

class _VendorRadarState extends State<VendorRadar> {
  late GoogleMapController _controller;
  final LatLng _center = const LatLng(37.7749, -122.4194); // Initial map center coordinates

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 12.0, // Initial zoom level
        ),
        markers: {
          Marker(
            markerId: MarkerId('vendor_marker'),
            position: _center,
            infoWindow: InfoWindow(
              title: 'Vendor Name', // Vendor's name or information
              snippet: 'Vendor Address', // Vendor's address or additional details
            ),
          ),
        },
      ),
    );
  }
}
