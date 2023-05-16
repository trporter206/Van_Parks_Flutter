import 'package:flutter/material.dart';
import 'location_widget.dart';
import 'main.dart';
import 'package:provider/provider.dart';
import 'locations_list_widget.dart';

class ExploreList extends StatefulWidget {

  const ExploreList({Key? key}) : super(key: key);

  @override
  ExploreListState createState() => ExploreListState();
}

class ExploreListState extends State<ExploreList> {
  late List<LocationWidget> locations;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    locations = appState.locations;
    return Scaffold(
      body: LocationsListWidget(locations: locations),
    );
  }
}
