
import 'package:flutter/material.dart';

class Coordinate {
  final double latitude;
  final double longitude;

  Coordinate({
    required this.latitude,
    required this.longitude,
  });
}

class Location {
  final String name;
  final Coordinate coordinates;
  final List<String> features;

  Location({
    required this.name,
    required this.coordinates,
    required this.features,
  });
}

class LocationWidget extends StatelessWidget {
  final Location location;

  const LocationWidget({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Name: ${location.name}'),
        Text('Coordinates: (${location.coordinates.latitude}, ${location.coordinates.longitude})'),
        Text('Features: ${location.features.join(', ')}'),
      ],
    );
  }
}