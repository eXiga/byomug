import 'dart:async';

import 'package:byomug/models/host.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  final List<Host> hosts;

  MapWidget({Key key, this.hosts}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = Set();

  @override
  void initState() {
    super.initState();
    widget.hosts.forEach((element) {
      _markers.add(Marker(
          markerId: MarkerId(element.id),
          draggable: false,
          position: LatLng(element.latitude, element.longitude),
          infoWindow: InfoWindow(title: element.name),
          icon: BitmapDescriptor.fromAsset('assets/icons/mug.png')));
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition:
              CameraPosition(target: LatLng(52.1120584, 20.8274313), zoom: 12),
          markers: _markers,
          onMapCreated: _onMapCreated)
    ]);
  }
}
