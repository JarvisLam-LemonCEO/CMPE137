import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
<<<<<<< HEAD
=======
import 'package:location/location.dart';
>>>>>>> f05fb346f76b290ee441fdc0fedbfea460ec3f2f

class VendorRadar extends StatefulWidget {
  const VendorRadar({Key? key}) : super(key: key);

  @override
  _VendorRadarState createState() => _VendorRadarState();
}

class _VendorRadarState extends State<VendorRadar> {
<<<<<<< HEAD
  late GoogleMapController _controller;
  final LatLng _center = const LatLng(37.7749, -122.4194); // Initial map center coordinates
=======
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
>>>>>>> f05fb346f76b290ee441fdc0fedbfea460ec3f2f

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
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
=======
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
>>>>>>> f05fb346f76b290ee441fdc0fedbfea460ec3f2f
    );
  }
}
