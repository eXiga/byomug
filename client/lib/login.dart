import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:byomug/widgets/card.dart';
import 'package:byomug/models/client.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final userNameFieldController = TextEditingController();
  final passwordFieldController = TextEditingController();
  var isLoading = false;

  Widget get _pageToDisplay {
    if (isLoading) {
      return _loadingView;
    } else {
      return _page;
    }
  }

  Widget get _loadingView {
    return Scaffold(
      appBar: AppBar(title: Text('Registration')),
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget get _page {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/logo.png'),
            fit: BoxFit.cover
          )
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 60.0, bottom: 15.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              FormCard(
                title: 'Login', 
                opacity: 0.8,
                 backgroundColor: Colors.white,
                 userNameFieldController: this.userNameFieldController,
                 passwordFieldController: this.passwordFieldController
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
                      onTap: () async {
                        setState(() {
                          isLoading = true;
                        });

                        var string = Client(
                          name: this.userNameFieldController.text,
                          password: this.passwordFieldController.text
                        ).toJson();


                        var user = await authenticateUser(string, () {
                          setState(() {
                            isLoading = false;
                            Navigator.pop(context);
                          });
                        });
                        
                        if (user.isHost) {
                          Navigator.pushNamed(context, '/home_host');
                        } else {
                          Navigator.pushNamed(context, '/home_client');
                        }
                          
                      },
                      child: Center(
                        child: Text("Sign in",
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
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Not user yet?', 
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "AT",
                          fontSize: 22
                        ),
                      ),
                      Text(' '),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: Text(
                          "Sign up!",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "AT",
                            fontWeight: FontWeight.bold,
                            fontSize: 22
                          )
                        ),
                      )
                    ],
                  )
                )
              )
            ]
          )
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _pageToDisplay;
  }
}

Future<Client> authenticateUser(Map body, void Function() fn) async {
  final response = await http.post(
    'https://byomug.herokuapp.com/users/authenticate',  body: body);

  if (response.statusCode != 200) {
    throw Exception("ERROR");
  } else {
    var user = Client.fromJson(json.decode(response.body));
    fn();
    return user;
  }
}