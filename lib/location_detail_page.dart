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
    var featuresWidgets = locationWidget.location.features.map((feature) => Padding(
      padding: const EdgeInsets.all(8.0),
      child:
          Row(
            children: [
              Icon(Icons.ac_unit),
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
        title: Text(
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
                  const CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.beach_access),
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
                  Expanded(child: InfoWidget(text1: "13.37", text2: "Hectares", iconSymbol: Icons.park_rounded)),
                  Expanded(child: InfoWidget(text1: "Has Washrooms", text2: "Dawn to Dusk", iconSymbol: Icons.bathroom)),
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




