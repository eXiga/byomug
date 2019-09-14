import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatelessWidget {
  static final HACKYEAH = LatLng(52.1120584, 20.8274313);
  final Completer<GoogleMapController> controller = Completer();
  final List<Marker> markers = [
    Marker(markerId: MarkerId('1'), draggable: false, position: HACKYEAH)
  ];

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(target: HACKYEAH, zoom: 15),
        markers: Set.from(markers),
        onMapCreated: (GoogleMapController _controller) {
          controller.complete(_controller);
        });
  }
}
