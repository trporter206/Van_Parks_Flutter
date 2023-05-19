import 'package:flutter/material.dart';
import 'location_widget.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class FilterWidget extends StatefulWidget {
  final List<LocationWidget> locations;
  final List<String> features;

  FilterWidget({required this.locations, required this.features});

  @override
  FilterWidgetState createState() => FilterWidgetState();
}

class FilterWidgetState extends State<FilterWidget> {
  List<String> selectedFeatures = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // create checkboxes for each feature
        ...widget.features.map((feature) => CheckboxListTile(
          title: Text(feature),
          value: selectedFeatures.contains(feature),
          onChanged: (checked) {
            setState(() {
              if (checked == true) {
                selectedFeatures.add(feature);
              } else {
                selectedFeatures.remove(feature);
              }
            });
          },
        )),

        // create a button to apply the filter
        ElevatedButton(
          onPressed: () => _filterLocations(),
          child: Text('Filter Locations'),
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
