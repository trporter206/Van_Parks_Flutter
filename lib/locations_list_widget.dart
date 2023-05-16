import 'package:flutter/material.dart';
import 'location_widget.dart';
import 'main.dart';
import 'location_detail_page.dart';
import 'package:provider/provider.dart';

class LocationsListWidget extends StatelessWidget {
  final List<LocationWidget> locations;

  const LocationsListWidget({Key? key, required this.locations}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: locations.map((LocationWidget locationWidget) {
        return Center(
          child: InkWell(
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
                width: 360,
                height: 75,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      const CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.location_on),
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
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold// You can adjust this value as needed
                              ),
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      locationWidget.location.size,
                                      style: const TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    const Text(" hectares"),
                                  ],
                                ),
                                const SizedBox(width: 8.0),
                                Row(
                                  children: [
                                    Text(
                                      "${locationWidget.location.features.length}",
                                      style: const TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    const Text(" features"),
                                  ],
                                ),

                              ],
                            ),
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
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
