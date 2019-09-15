import 'dart:async';
import 'dart:convert';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:byomug/models/scan-response.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class ScanScreen extends StatefulWidget {
  final String hostId;

  ScanScreen({Key key, this.hostId}) : super(key: key);

  @override
  _ScanState createState() => new _ScanState();
}

class _ScanState extends State<ScanScreen> {
  ScanResponse _scanResponse;
  String _scanError;

  void _onScan(String clientId) {
    Map<String, String> body = Map();
    body.putIfAbsent('hostId', () => widget.hostId);
    body.putIfAbsent('userId', () => clientId);
    scanRequest(body).then((scanResponse) {
      setState(() {
        _scanResponse = scanResponse;
        _scanError = null;
      });
    }).catchError((error) {
      setState(() {
        _scanResponse = null;
        _scanError = '$error';
      });
    });
  }

  Future<ScanResponse> scanRequest(Map body) async {
    final response =
        await http.post('https://byomug.herokuapp.com/users/scan', body: body);

    if (response.statusCode == 200) {
      return ScanResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load summary');
    }
  }

  void _onScanClick() {
    scan();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = List();
    if (_scanResponse != null) {
      widgets.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('${_scanResponse.name}: ', style: TextStyle(fontSize: 30.0)),
          Text('${_scanResponse.score}',
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold))
        ],
      ));
    }
    widgets.add(Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: RaisedButton(
          color: Colors.blue,
          textColor: Colors.white,
          splashColor: Colors.blueGrey,
          onPressed: _onScanClick,
          child: const Text('Scan QR Code')),
    ));
    if (_scanError != null) {
      widgets.add(Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Text(
          _scanError,
          textAlign: TextAlign.center,
        ),
      ));
    }
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: widgets,
      ),
    );
  }

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      _onScan(barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          _scanResponse = null;

          _scanError = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() {
          _scanResponse = null;
          _scanError = 'Unknown error: $e';
        });
      }
    } on FormatException {
      setState(() {
        _scanResponse = null;
        _scanError =
            'null (User returned using the "back"-button before scanning anything. Result)';
      });
    } catch (e) {
      setState(() {
        _scanResponse = null;
        this._scanError = 'Unknown error: $e';
      });
    }
  }
}
