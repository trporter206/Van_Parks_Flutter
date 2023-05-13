import 'package:flutter/material.dart';
import 'location_widget.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';
import 'main.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(locationWidget.location.name),
      ),
      body: Center(
          child: Column (
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () => appState.toggleFavorite(locationWidget),
                  child: Text(
                      favoriteLocations.contains(locationWidget) ? "Remove from favorites" : "Add to favorites"
                  )
              ),
              Text(locationWidget.location.features[0]),
              Text(locationWidget.location.features[1]),
            ],
          )
      ),
    );
  }
}


