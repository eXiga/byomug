import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:byomug/widgets/card.dart';
import 'package:byomug/models/user.dart';

class RegistrationPage extends StatefulWidget {
  RegistrationPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  final userNameFieldController = TextEditingController();
  final passwordFieldController = TextEditingController();

  @override
  void dispose() {
    this.userNameFieldController.dispose();
    this.passwordFieldController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registration")),
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 60.0, bottom: 15.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              FormCard(
                title: "Create new user", 
                opacity: 1.0, 
                backgroundColor: Colors.white,
                userNameFieldController: this.userNameFieldController,
                passwordFieldController: this.passwordFieldController,
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.greenAccent,
                        Colors.green
                      ]),
                      borderRadius: BorderRadius.circular(6.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.green.withOpacity(.3),
                            offset: Offset(0.0, 8.0),
                            blurRadius: 8.0)
                      ]),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        var user = User(
                          username: this.userNameFieldController.text,
                          password: this.passwordFieldController.text
                          );
                        registerUser(user.toJson());
                        Navigator.pushReplacementNamed(context, '/home');
                      },
                      child: Center(
                        child: Text("Register",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "AT",
                                fontSize: 22)
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            ]
          )
        )
      ),
    );
  }
}

Future<User> registerUser(Map body) async {
  final response = await http.post(
    'https://byomug.herokuapp.com/users/register',  body: body);

  if (response.statusCode != 200) {
    throw Exception("ERROR");
  } else {
    var user = User.fromJson(json.decode(response.body));
    return user;
  }
}