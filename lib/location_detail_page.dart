import 'package:flutter/material.dart';

import 'location_widget.dart';

class DetailPage extends StatelessWidget {
  final LocationWidget locationWidget;

  const DetailPage({super.key, required this.locationWidget});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(locationWidget.location.name),
      ),
      body: Center(
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(locationWidget.location.features[0]),
            Text(locationWidget.location.features[1])
          ],
        )
      ),
    );
  }
}
