import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class VendorRadar extends StatefulWidget {
  const VendorRadar({Key? key}) : super(key: key);

  @override
  _VendorRadarState createState() => _VendorRadarState();
}

class _VendorRadarState extends State<VendorRadar> {
  late GoogleMapController mapController;
  late LatLng _initialLocation;
  LocationData? _currentPosition;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _currentPosition = await location.getLocation();
    setState(() {
      _initialLocation = LatLng(_currentPosition!.latitude!, _currentPosition!.longitude!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vendor Radar'),
      ),
      body: _currentPosition != null
          ? GoogleMap(
              onMapCreated: (controller) {
                setState(() {
                  mapController = controller;
                });
              },
              initialCameraPosition: CameraPosition(
                target: _initialLocation,
                zoom: 14,
              ),
              myLocationEnabled: true, // Enable my location button
              markers: {
                Marker(
                  markerId: MarkerId('vendorMarker'),
                  position: _initialLocation,
                  infoWindow: InfoWindow(
                    title: 'Vendor Location',
                    snippet: 'This is the location of the vendor',
                  ),
                ),
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
