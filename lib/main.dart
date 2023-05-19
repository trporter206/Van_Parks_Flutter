
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
        home: const MyHomePage(),
      ),
    );
  }
}


class MyAppState extends ChangeNotifier {
  var favoriteLocations = <LocationWidget>[];
  var locations = <LocationWidget>[
    LocationWidget(location:
      Location(
        name: 'Kitsilano Beach Park',
        about: 'This very popular park boasts clean sand beaches, beautiful views of English Bay and downtown Vancouver, the fantastic Boathouse restaurant, and wide lawns perfect for throwing a Frisbee or relaxing in the sun.  The sparkling salt waters of the heated outdoor pool are especially inviting, and the pool has the distinction of being Canada\'s longest at 137m.A playground is the park\'s newest feature. The city\'s largest fully accessible playground is a legacy of the Vancouver 2010 Olympic and Paralympic Winter Games and one of three showcase inclusive playgrounds built in the 2010 Winter Games host communities of Vancouver, Whistler and Richmond. New play opportunities such as sand play table, rotating climber, and saucer swings have been included to ensure universal access and encourage imaginative play, sensory experiences and fun for children of all ages and abilities. A wheelchair accessible surface also allows parents and caregivers with physical disabilities access to the playground.',
        address: '1499 Arbutus Street',
        coordinates: Coordinate(latitude: 49.273431, longitude: -123.153901),
        features: ['Basketball Courts', 'Beaches', 'Food Concessions', 'Outdoor Swimming Pools'],
        neighbourhood: 'Kitsilano',
        size: '13.47',
        washrooms: 'Y',
      )
    ),
    LocationWidget(location:
      Location(
        name: 'Queen Elizabeth Park',
        about: 'Prince Edward Park’s play areas overlook an open grassy field, perfect for a game of soccer or for throwing a Frisbee.  Relax on a bench or meet with neighbours for an evening stroll around the park.',
        address: '4600 Cambie Street',
        coordinates: Coordinate(latitude: 49.240978, longitude: -123.112028),
        features: ['Field Houses', 'Playgrounds', 'Soccer Fields', 'Washrooms', 'Water/Spray Parks'],
        neighbourhood: 'Riley-Little Mountain',
        size: '52.98',
        washrooms: 'Y',
      )
    ),
  ];
  var filteredLocations = <LocationWidget>[];

  MyAppState() {
    filteredLocations = List.from(locations);
  }

  void toggleFavorite([LocationWidget? locationWidget]) {
    if (locationWidget != null && favoriteLocations.contains(locationWidget)) {
      favoriteLocations.remove(locationWidget);
    } else if (locationWidget != null) {
      favoriteLocations.add(locationWidget);
    }
    notifyListeners();
  }

  void updateFilteredLocations(List<LocationWidget> newLocations) {
    filteredLocations = newLocations;
    notifyListeners();
  }
}