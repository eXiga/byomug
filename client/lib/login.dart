import 'package:flutter/material.dart';
import 'package:byomug/widgets/card.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: <Widget>[
           Container(
            child: Padding(
              padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 60.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("BYOM",
                          style: TextStyle(
                                  fontFamily: "AT",
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold
                                )
                      )
                    ],
                  ),
                  FormCard(),
                  SizedBox(
                    height: 30,
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
                            Navigator.pushReplacementNamed(context, '/home');
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Not user yet?', 
                        style: TextStyle(
                          color: Colors.green,
                          fontFamily: "AT",
                          fontSize: 22
                        ),
                      ),
                      Text(' '),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "Sign up!",
                          style: TextStyle(
                            color: Colors.green,
                            fontFamily: "AT",
                            fontWeight: FontWeight.bold,
                            fontSize: 22
                          )
                        ),
                      )
                    ],
                  )
                ]
              )
            )
          ),
        ],
      ),
    );
  }
}