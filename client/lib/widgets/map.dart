import 'dart:async';

import 'package:byomug/models/host.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatelessWidget {
  final List<Host> hosts;
  final Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = Set();

  MapWidget({Key key, this.hosts}) : super(key: key);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    hosts.forEach((element) {
      _markers.add(Marker(
          markerId: MarkerId(element.id),
          draggable: false,
          position: LatLng(element.latitude, element.longitude),
          infoWindow: InfoWindow(title: element.name),
          icon: BitmapDescriptor.fromAsset('assets/icons/mug.png')));
    });
    return Stack(children: <Widget>[
      GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition:
              CameraPosition(target: LatLng(52.1120584, 20.8274313), zoom: 10),
          markers: _markers,
          onMapCreated: _onMapCreated)
    ]);
  }
}
