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
          // backgroundColor: const Color.fromRGBO(222, 173, 0, 100),
          // centerTitle: true,
          // title: const Text('Vendor Locator'),
        ),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: allVendors.vendors.first.location,
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
    // Use the controller for map functionalities
  }
}

