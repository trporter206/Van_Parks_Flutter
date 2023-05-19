import 'package:flutter/material.dart';
import 'location_widget.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';
import 'main.dart';
import 'info_widget.dart';

class DetailPage extends StatefulWidget {
  final LocationWidget locationWidget;
  const DetailPage({Key? key, required this.locationWidget}) : super(key: key);

  @override
  DetailPageState createState() => DetailPageState();
}

class DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var favoriteLocations = appState.favoriteLocations;
    var locationWidget = widget.locationWidget;
    bool hasWashrooms = locationWidget.location.washrooms != null && locationWidget.location.washrooms == 'Y';
    var featuresWidgets = locationWidget.location.features.map((feature) => Padding(
      padding: const EdgeInsets.all(8.0),
      child:
          Row(
            children: [
              Icon(getIconForFeature(feature)),
              const SizedBox(width: 5),
              Text(
                feature,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          )
    )).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Vancouver Parks',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column (
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.blue.shade100,
                    child: Icon(Icons.beach_access, size: 35, color: Colors.blue.shade800),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          locationWidget.location.name,
                          style: const TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold// You can adjust this value as needed
                          ),
                        ),
                        Text(
                            "${locationWidget.location.neighbourhood}, ${locationWidget.location.address}",
                            style: const TextStyle(
                                fontWeight: FontWeight.w300
                            )
                        )
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      context.watch<MyAppState>().favoriteLocations.contains(locationWidget) ? Icons.bookmark : Icons.bookmark_border,
                      color: Colors.orange,
                    ),
                    onPressed: () {
                      context.read<MyAppState>().toggleFavorite(locationWidget);
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: InfoWidget(text1: locationWidget.location.size, text2: "Hectares", iconSymbol: Icons.park_rounded, circleColor: Colors.green)),
                  Expanded(child: InfoWidget(text1: locationWidget.location.washrooms == 'Y' ? 'Has Washrooms' : 'No Washrooms',
                                             text2: locationWidget.location.washrooms == 'Y' ? "Dawn to Dusk" : "No Information",
                                             iconSymbol: Icons.bathroom, circleColor: Colors.grey)),
                  // Expanded(
                  //     child: InfoWidget(
                  //         text1: locationWidget.location.washrooms != null && locationWidget.location.washrooms == 'Y' ? 'Has Washrooms' : 'No Washrooms',
                  //         text2: locationWidget.location.washrooms != null && locationWidget.location.washrooms == 'Y' ? 'Dawn to Dusk' : 'No Information',
                  //         iconSymbol: locationWidget.location.washrooms != null && locationWidget.location.washrooms == 'Y' ? Icons.bathroom : Icons.warning_amber_rounded,
                  //         circleColor: Colors.grey
                  //     )
                  // ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: featuresWidgets,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(locationWidget.location.about),
            ),
          ],
        ),
      ),
    );
  }
}

IconData getIconForFeature(String feature) {
  switch(feature) {
    case "Dogs Off-Leash Areas":
      return Icons.pets;
    case "Playgrounds":
      return Icons.toys;
    case "Ultimate Fields":
      return Icons.disc_full;
    case "Tennis Courts":
      return Icons.sports_tennis;
    case "Basketball Courts":
      return Icons.sports_basketball;
    case "Soccer Fields":
      return Icons.sports_soccer;
    case "Community Centres":
      return Icons.other_houses;
    case "Rinks":
      return Icons.ice_skating;
    case "Beaches":
      return Icons.beach_access;
    case "Food Concessions":
      return Icons.fastfood_rounded;
    case "Outdoor Swimming Pools":
      return Icons.pool;
    case "Restaurants":
      return Icons.restaurant;
    case "Seawall":
      return Icons.directions_walk;
    case "Washrooms":
      return Icons.bathroom;
    case "Water/Spray Parks":
      return Icons.shower;
    case "Ball Hockey":
      return Icons.sports_hockey_rounded;
    case "Baseball Diamonds":
      return Icons.sports_baseball;
    case "Field Houses":
      return Icons.other_houses_rounded;
    case "Jogging Trails":
      return Icons.directions_run;
    case "Lighted Fields":
      return Icons.light;
    case "Pickle Ball":
      return Icons.sports_tennis_rounded;
    case "Picnic Sites":
      return Icons.fastfood_rounded;
    case "Rugby Fields":
      return Icons.sports_rugby_rounded;
    case "Softball":
      return Icons.sports_baseball;
    case "Bowling Greens":
      return Icons.circle;
    case "Football Fields":
      return Icons.sports_football_rounded;
    default:
      return Icons.info;  // default icon for features not explicitly listed
  }
}