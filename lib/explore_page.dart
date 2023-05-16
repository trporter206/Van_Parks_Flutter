import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'location_detail_page.dart';
import 'main.dart';
import 'explore_list.dart'; // Don't forget to import ExploreList

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  ExplorePageState createState() => ExplorePageState();
}

class ExplorePageState extends State<ExplorePage> {
  static const LatLng sourceLocation = LatLng(49.257714, -123.099294);
  late List<Marker> markers;
  bool showMapView = true; // New State Variable

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
          ElevatedButton(
            onPressed: () {
              setState(() {
                showMapView = !showMapView;
              });
            },
            child: Text(showMapView ? 'Show List View' : 'Show Map View'),
          ),
          Expanded(
            child: showMapView
                ? GoogleMap(
              markers: markers.toSet(),
              initialCameraPosition: const CameraPosition(
                target: sourceLocation,
                zoom: 12.0,
              ),
            )
                : const ExploreList(),  // Display ExploreList if showMapView is false
          ),
        ],
      ),
    );
  }
}
