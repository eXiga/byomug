import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:ui';
import 'package:flutter/rendering.dart';

class QrCodeDisplayWidget extends StatelessWidget {
  final GlobalKey globalKey = new GlobalKey();
  final String id;

  QrCodeDisplayWidget({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bodyHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewInsets.bottom;
    return Container(
      color: const Color(0xFFFFFFFF),
      child: Column(
        children: <Widget>[
          Text('CLIENT', style: TextStyle(fontSize: 30.0)),
          Expanded(
            child: Center(
              child: RepaintBoundary(
                key: globalKey,
                child: QrImage(
                  foregroundColor: Colors.green,
                  data: id,
                  size: 0.5 * bodyHeight
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
