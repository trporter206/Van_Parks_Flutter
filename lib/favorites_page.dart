import 'package:flutter/material.dart';

import 'location_widget.dart';

class FavoritesPage extends StatelessWidget {

  static List<LocationWidget> locationWidgets = [
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
  ];

  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LocationsListWidget(locations: locationWidgets),
    );
  }
}

class LocationsListWidget extends StatelessWidget {
  final List<LocationWidget> locations;

  const LocationsListWidget({super.key, required this.locations});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: locations.map((LocationWidget locationWidget) {
        return Text(locationWidget.location.name);
      }).toList(),
    );
  }
}