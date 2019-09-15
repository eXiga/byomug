import 'package:byomug/models/client.dart';
import 'package:flutter/material.dart';

import 'widgets/client-info.dart';
import 'widgets/hosts-map.dart';

class HomeClientScreenArguments {
  final Client client;

  HomeClientScreenArguments(this.client);
}

class HomeClientScreen extends StatefulWidget {
  @override
  _HomeClientScreenState createState() => _HomeClientScreenState();
}

class _HomeClientScreenState extends State<HomeClientScreen> {
  static const MAP_INDEX = 1;

  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget getBody(BuildContext context) {
    if (MAP_INDEX == selectedIndex) {
      return HostsMapWidget();
    } else {
      final HomeClientScreenArguments args = ModalRoute.of(context).settings.arguments;
      return ClientInfoWidget(client: args.client);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('byomug'),
      ),
      body: getBody(context),
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
