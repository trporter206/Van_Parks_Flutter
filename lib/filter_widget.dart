import 'package:flutter/material.dart';
import 'location_widget.dart';
import 'package:provider/provider.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'main.dart';

class FilterWidget extends StatefulWidget {
  final List<LocationWidget> locations;
  // final List<String> features;

  FilterWidget({required this.locations});

  @override
  FilterWidgetState createState() => FilterWidgetState();
}

class FilterWidgetState extends State<FilterWidget> {
  List<String> selectedFeatures = [];

  @override
  Widget build(BuildContext context) {
    var items = park_features.map((feature) => MultiSelectItem<String>(feature, feature)).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              color: Colors.green,
              width: 2,
              ),
            ),
            child: MultiSelectDialogField(
              items: items,
              title: Text("Features"),
              selectedColor: Colors.green,
              searchable: true,
              buttonText: Text("Features"),
              onConfirm: (values) {
                setState(() {
                  selectedFeatures = values.cast<String>();
                  _filterLocations();
                });
              },
              chipDisplay: MultiSelectChipDisplay(
                onTap: (value) {
                  setState(() {
                    selectedFeatures.remove(value);
                    _filterLocations();
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _filterLocations() {
    List<LocationWidget> filteredLocations = widget.locations
        .where((location) =>
        selectedFeatures.every((feature) => location.location.features.contains(feature)))
        .toList();
    context.read<MyAppState>().updateFilteredLocations(filteredLocations);
  }
}

var park_features = [
  "Dogs Off-Leash Areas",
  "Playgrounds",
  "Ultimate Fields",
  "Tennis Courts",
  "Basketball Courts",
  "Soccer Fields",
  "Community Centres",
  "Rinks",
  "Beaches",
  "Food Concessions",
  "Outdoor Swimming Pools",
  "Restaurants",
  "Seawall",
  "Washrooms",
  "Water/Spray Parks",
  "Ball Hockey",
  "Baseball Diamonds",
  "Field Houses",
  "Jogging Trails",
  "Lighted Fields",
  "Pickle Ball",
  "Picnic Sites",
  "Rugby Fields",
  "Softball",
  "Bowling Greens",
  "Football Fields",
  "Field Hockey",
  "Skateboard Parks",
  "Golf Courses",
  "Wading Pool",
  "Cricket Pitches",
  "Disc Golf Courses",
  "Hellenic Garden",
  "Perimeter Walking Path",
  "Indoor Swimming Pools",
  "Running Tracks",
  "Community Halls",
  "Horseshoe Pitch",
  "Sport Court",
  "Wedding Ceremony Site",
  "Lacrosse Boxes",
  "Outdoor Roller Hockey Rinks",
  "Exercise Stations",
  "Picnic Benches",
  "Senior\'s Wellness Circuit"
];
