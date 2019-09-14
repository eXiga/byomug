import 'package:byomug/home.dart';
import 'package:byomug/register.dart';
import 'package:flutter/material.dart';
import 'package:byomug/login.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomeScreen(),
        '/register': (context) => RegistrationPage()
      },
      title: 'byomug',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    ));
