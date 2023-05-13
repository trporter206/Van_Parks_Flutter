import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:van_parks_flutter/location_widget.dart';
import 'location_detail_page.dart';
import 'main.dart';

class ExplorePage extends StatefulWidget {

  const ExplorePage({Key? key}) : super(key: key);

  @override
  ExplorePageState createState() => ExplorePageState();
}

class ExplorePageState extends State<ExplorePage> {
  static const LatLng sourceLocation = LatLng(49.257714, -123.099294);
  late List<Marker> markers;

  @override
  Widget build(BuildContext context) {
  var appState = context.watch<MyAppState>();
  markers = appState.locations.map((locationWidget) => Marker(
    markerId: MarkerId(locationWidget.location.name),
    position: LatLng(
        locationWidget.location.coordinates.latitude,
        locationWidget.location.coordinates.longitude
    ),
    infoWindow: InfoWindow(
      title: locationWidget.location.name,
    ),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(locationWidget: locationWidget,),
        ),
      );
    },
  )).toList();
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              markers: markers.toSet(),
              initialCameraPosition: const CameraPosition(
                target: sourceLocation,
                zoom: 12.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
