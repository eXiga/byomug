import 'package:byomug/scan.dart';
import 'package:flutter/material.dart';

class HomeHostScreen extends StatefulWidget {
  @override
  _HomeHostScreenState createState() => _HomeHostScreenState();
}

class _HomeHostScreenState extends State<HomeHostScreen> {

  Widget getBody() {
    return ScanScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('byomug'),
      ),
      body: getBody(),
    );
  }
}
