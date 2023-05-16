
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
  final String about;
  final String neighbourhood;
  final String size;
  final String address;
  final Coordinate coordinates;
  final List<String> features;
  final String washrooms;

  Location({
    required this.name,
    required this.about,
    required this.neighbourhood,
    required this.size,
    required this.address,
    required this.coordinates,
    required this.features,
    required this.washrooms
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