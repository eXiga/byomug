import 'package:byomug/home.dart';
import 'package:flutter/material.dart';
import 'package:byomug/login.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/home',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomeScreen()
      },
      title: 'byomug',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    ));
