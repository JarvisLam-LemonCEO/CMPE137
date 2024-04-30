import 'package:flutter/material.dart';
import 'vendorRadar.dart'; // Import the file containing the VendorLocation class

import 'package:google_maps_flutter/google_maps_flutter.dart' as GoogleMaps;

class customerRadar extends StatelessWidget {
  final List<VendorLocation> vendorsLocations;

  const customerRadar({Key? key, required this.vendorsLocations}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vendor Locator'),
      ),
      body: GoogleMaps.GoogleMap(
        initialCameraPosition: GoogleMaps.CameraPosition(
          target: GoogleMaps.LatLng(0, 0),
          zoom: 15,
        ),
        markers: Set.of(vendorsLocations.map((vendor) => GoogleMaps.Marker(
          markerId: GoogleMaps.MarkerId(vendor.name),
          position: vendor.location,
          infoWindow: GoogleMaps.InfoWindow(
            title: vendor.name,
          ),
        ))),
      ),
    );
  }
}
