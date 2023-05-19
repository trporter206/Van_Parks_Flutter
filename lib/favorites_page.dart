import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'location_widget.dart';
import 'main.dart';
import 'locations_list_widget.dart';

class FavoritesPage extends StatefulWidget {

  const FavoritesPage({Key? key}) : super(key: key);

  @override
  FavoritesPageState createState() => FavoritesPageState();
}

class FavoritesPageState extends State<FavoritesPage> {
  late List<LocationWidget> locations;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    locations = appState.favoriteLocations;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child:
              Text(
                'You have ${locations.length} favorite parks',
                style:
                  TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
              ),
          ),
          Expanded(
              child: LocationsListWidget(locations: locations),
          ),
        ],
      )
    );
  }
}
