import 'package:byomug/models/client.dart';
import 'package:byomug/models/summary.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:ui';
import 'package:flutter/rendering.dart';

class ClientInfoWidget extends StatelessWidget {
  final Client client;
  final Summary summary;

  ClientInfoWidget({Key key, this.client, this.summary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = <Widget>[
      Text('Greetings', style: TextStyle(fontSize: 30.0)),
      Text('${client.name}',
          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold))
    ];
    if (summary != null) {
      widgets.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Cups: ', style: TextStyle(fontSize: 30.0)),
          Text('${summary.cups}',
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold))
        ],
      ));
    }
    return Column(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(top: 16.0),
            child: Column(children: widgets)),
        Expanded(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Your QR Code',
                style: TextStyle(fontSize: 30.0),
              ),
              QrImage(
                  foregroundColor: Colors.black,
                  data: client.id,
                  size: MediaQuery.of(context).size.width * 0.60)
            ],
          )),
        )
      ],
    );
  }
}
