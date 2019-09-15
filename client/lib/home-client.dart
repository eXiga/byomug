import 'dart:convert';

import 'package:byomug/models/client.dart';
import 'package:flutter/material.dart';

import 'models/host.dart';
import 'models/summary.dart';
import 'widgets/client-info.dart';
import 'widgets/hosts-map.dart';
import 'package:http/http.dart' as http;

class HomeClientScreenArguments {
  final Client client;

  HomeClientScreenArguments(this.client);
}

class HomeClientScreen extends StatefulWidget {
  final Client client;

  HomeClientScreen({Key key, this.client}) : super(key: key);

  @override
  _HomeClientScreenState createState() => _HomeClientScreenState();
}

class _HomeClientScreenState extends State<HomeClientScreen> {
  static const MAP_INDEX = 1;

  int _selectedTabIndex = 0;
  Summary _summary;
  List<Host> _hosts = List();

  @override
  void initState() {
    super.initState();
    fetchSummary(widget.client.id).then((summary) {
      setState(() {
        _summary = summary;
      });
    });
    fetchHosts().then((hosts) {
      setState(() {
        _hosts = hosts;
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

  Future<Summary> fetchSummary(String id) async {
    final response = await http.get('https://byomug.herokuapp.com/users/$id/summary');
    if (response.statusCode == 200) {
      return Summary.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load summary');
    }
  }

  void onItemTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  Widget createBody(BuildContext context) {
    if (MAP_INDEX == _selectedTabIndex) {
      return HostsMapWidget(hosts: _hosts);
    } else {
      return ClientInfoWidget(client: widget.client, summary: _summary);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('byomug'),
      ),
      body: createBody(context),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('Map'),
          ),
        ],
        currentIndex: _selectedTabIndex,
        selectedItemColor: Colors.green,
        onTap: onItemTapped,
      ),
    );
  }
}
