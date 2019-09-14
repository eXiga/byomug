import 'package:byomug/home.dart';
import 'package:flutter/material.dart';
import 'package:byomug/login.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => LoginPage(),
    '/home': (context) => HomeScreen()
  },
));
