import 'dart:async';

import 'package:byomug/models/host.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HostsMapWidget extends StatelessWidget {
  final List<Host> hosts;
  final Completer<GoogleMapController> _controller = Completer();

  HostsMapWidget({Key key, this.hosts}) : super(key: key);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    List<Marker> markers = hosts.map((host) {
      return Marker(
          markerId: MarkerId(host.id),
          draggable: false,
          position: LatLng(host.location.latitude, host.location.longitude),
          infoWindow: InfoWindow(title: host.name),
          icon: BitmapDescriptor.fromAsset('assets/icons/mug.png'));
    }).toList();
    return GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:
            CameraPosition(target: LatLng(52.1120584, 20.8274313), zoom: 10),
        markers: Set.from(markers),
        onMapCreated: _onMapCreated);
  }
}
