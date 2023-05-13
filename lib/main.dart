
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:van_parks_flutter/explore_page.dart';
import 'package:van_parks_flutter/favorites_page.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';
import 'location_widget.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Parks App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        ),
        home: MyHomePage(),
      ),
    );
  }
}


class MyAppState extends ChangeNotifier {
  var favoriteLocations = <LocationWidget>[];
  var locations = <LocationWidget>[
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

  void toggleFavorite([LocationWidget? locationWidget]) {
    if (locationWidget != null && favoriteLocations.contains(locationWidget)) {
      favoriteLocations.remove(locationWidget);
    } else if (locationWidget != null) {
      favoriteLocations.add(locationWidget);
    }
    notifyListeners();
  }
}