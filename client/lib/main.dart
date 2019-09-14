import 'package:flutter/material.dart';

import 'home-client.dart';
import 'home-host.dart';
import 'login.dart';
import 'register.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home_host': (context) => HomeHostScreen(),
        '/home_client': (context) => HomeClientScreen(),
        '/register': (context) => RegistrationPage()
      },
      title: 'byomug',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    ));
