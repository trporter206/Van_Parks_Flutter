import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'location_widget.dart';
import 'main.dart';
import 'location_detail_page.dart';

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
      body: LocationsListWidget(locations: locations),
    );
  }
}

class LocationsListWidget extends StatelessWidget {
  final List<LocationWidget> locations;

  const LocationsListWidget({Key? key, required this.locations}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: locations.map((LocationWidget locationWidget) {
        return Center(
          child: InkWell(  // Wrap Card with InkWell
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(locationWidget: locationWidget,),
                ),
              );
            },
            child: Card(
              child: SizedBox(
                width: 300,
                height: 100,
                child: Center(child: Text(locationWidget.location.name)),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
