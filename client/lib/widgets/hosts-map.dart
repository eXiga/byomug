import 'dart:async';
import 'dart:convert';

import 'package:byomug/models/host.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class HostsMapWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HostsMapState();
  }
}

class _HostsMapState extends State<HostsMapWidget> {
  final Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = Set();

  @override
  void initState() {
    super.initState();
    fetchHosts().then((hosts) {
      List<Marker> markers = hosts.map((host) {
        return Marker(
            markerId: MarkerId(host.id),
            draggable: false,
            position: LatLng(host.location.latitude, host.location.longitude),
            infoWindow: InfoWindow(title: host.name),
            icon: BitmapDescriptor.fromAsset('assets/icons/mug.png'));
      }).toList();
      setState(() {
        _markers = Set.from(markers);
      });
    });
  }

  Future<List<Host>> fetchHosts() async {
    final response = await http.get('https://byomug.herokuapp.com/hosts');
    print(response.statusCode);
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<Host>((json) => Host.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load hosts');
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:
            CameraPosition(target: LatLng(52.1120584, 20.8274313), zoom: 10),
        markers: _markers,
        onMapCreated: _onMapCreated);
  }
}
