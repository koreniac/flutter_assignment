import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_application_1/location.dart';

class MapPage extends StatefulWidget {

  final String title;
  final Location hosLocation;
  // const MapPage({Key? key, required this.title, required this.hosLocation}) : super(key: key);

  const MapPage({super.key, required this.title, required this.hosLocation});
// const MyHomePage({super.key, required this.title});
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController? _controller;


  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    LatLng _center =   LatLng(widget.hosLocation.lat, widget.hosLocation.lng);
    return Scaffold(
      appBar: AppBar(
          title:  Text(widget.title),
          backgroundColor: Colors.cyan,
        ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 3.0,
        ),
        markers: Set.from([
          Marker(
            markerId: MarkerId('marker_1'),
            position: _center,
            infoWindow: InfoWindow(
              title: 'Title',
              snippet: 'Snippet',
            ),
          ),
        ]),
      ),
    );
  }
}