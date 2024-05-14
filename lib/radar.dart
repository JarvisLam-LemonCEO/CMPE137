import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'vendorInfo.dart';

class Vardar extends StatefulWidget {
  const Vardar({Key? key});

  @override
  _VardarState createState() => _VardarState();
}

class _VardarState extends State<Vardar> {
  late final ListOfVendors allVendors;
  late GoogleMapController mapController; // Add GoogleMapController instance

  @override 
  void initState(){
    super.initState();
    allVendors = ListOfVendors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0), // Set appBar height to 0
        child: AppBar(
          automaticallyImplyLeading: false, // Set automaticallyImplyLeading to false
        ),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: allVendors.vendors.first.location,
          zoom: 15.0,
        ),
        markers: Set<Marker>.of(allVendors.vendors.map((vendor) {
          return Marker(
            markerId: MarkerId(vendor.name),
            position: vendor.location,
            infoWindow: InfoWindow(
              title: vendor.name,
              snippet: vendor.rating,
            ),
          );
        })),
        zoomControlsEnabled: true, // Enable zoom controls
        myLocationEnabled: true, // Enable current location button
        myLocationButtonEnabled: true, // Enable current location button
        onTap: _onMapTapped, // Handle map tap events
        onCameraMove: _onCameraMove, // Handle camera movement
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  void _onMapTapped(LatLng latLng) {
    // Handle tap events on the map
  }

  void _onCameraMove(CameraPosition position) {
    // Handle camera movement
  }
}
