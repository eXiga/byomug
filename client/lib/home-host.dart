import 'package:byomug/scan.dart';
import 'package:flutter/material.dart';

class HomeHostScreenArguments {
  final String hostId;

  HomeHostScreenArguments(this.hostId);
}

class HomeHostScreen extends StatefulWidget {
  final String hostId;

  HomeHostScreen({Key key, this.hostId}) : super(key: key);

  @override
  _HomeHostScreenState createState() => _HomeHostScreenState();
}

class _HomeHostScreenState extends State<HomeHostScreen> {

  Widget createBody() {
    return ScanScreen(hostId: widget.hostId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('byomug'),
      ),
      body: createBody(),
    );
  }
}
