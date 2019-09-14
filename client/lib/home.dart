import 'package:byomug/models/host.dart';
import 'package:flutter/material.dart';

import 'map.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const MAP_INDEX = 1;

  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget getBody() {
    if (MAP_INDEX == selectedIndex) {
      List<Host> hosts = List();
      hosts.add(Host('1', 'Starbucks', 52.1655636, 20.7725414));
      hosts.add(Host('2', 'Costa Coffee', 52.235547, 20.957479));
      hosts.add(Host('3', 'Caffe Nero', 52.157802, 21.032832));
      return MapWidget(hosts: hosts);
    } else {
      return Center(child: Text('Home'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('byomug'),
      ),
      body: getBody(),
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
        currentIndex: selectedIndex,
        selectedItemColor: Colors.green,
        onTap: onItemTapped,
      ),
    );
  }
}
