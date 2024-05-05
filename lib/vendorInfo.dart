import 'package:google_maps_flutter/google_maps_flutter.dart';

class Vendors{
  late String name;
  late LatLng location;
  late String rating;

  Vendors({required this.name, required this.location, required this.rating});
}

class ListOfVendors
{
  List<Vendors> vendors = [];

  ListOfVendors(){
    vendors = [
      Vendors(name: 'Loco Tacos', location:LatLng(37.3352, -121.8811), rating: 'Rating 3.8/5'),
      Vendors(name: 'Mobile Ice Creamary', location:LatLng(37.3552, -121.8211), rating: 'Rating 4.8/5'),
      Vendors(name: 'Fresh Fruit', location:LatLng(37.3102, -121.9011), rating: 'Rating 3.4/5'),
      Vendors(name: 'Munchies on the Go', location:LatLng(37.2952, -121.7911), rating: 'Rating 4.2/5'),
    ];
  }
}