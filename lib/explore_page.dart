import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:van_parks_flutter/location_widget.dart';
import 'location_detail_page.dart';

class ExplorePage extends StatefulWidget {

  const ExplorePage({Key? key}) : super(key: key);

  @override
  ExplorePageState createState() => ExplorePageState();
}

class ExplorePageState extends State<ExplorePage> {
  static const LatLng sourceLocation = LatLng(49.257714, -123.099294);
  late List<LocationWidget> locations = <LocationWidget>[
    LocationWidget(location: Location(
      name: 'Central Park',
      coordinates: Coordinate(latitude: 49.257714, longitude: -123.099294),
      features: ['Playgrounds', 'Zoo', 'Museums'],
    )),
    LocationWidget(location: Location(
      name: 'Stanley Park',
      coordinates: Coordinate(latitude: 49.273982, longitude: -123.117628),
      features: ['Playgrounds', 'Zoo', 'Museums'],
    )),
    LocationWidget(location: Location(
      name: 'Pleasant Park',
      coordinates: Coordinate(latitude: 49.276090, longitude: -123.152661),
      features: ['Playgrounds', 'Zoo', 'Museums'],
    )),
  ];
  late List<Marker> markers;

  @override
  void initState() {
    super.initState();

    markers = locations.map((locationWidget) => Marker(
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              markers: markers.toSet(),
              initialCameraPosition: const CameraPosition(
                target: sourceLocation,
                zoom: 11.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
