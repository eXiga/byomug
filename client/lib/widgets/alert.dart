import 'package:flutter/material.dart';

class ErrorAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Something went wrong :('),
      content: Text('Request failed'),
      actions: <Widget>[
        new FlatButton(
          child: Text('Ok'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}