import 'package:flutter/material.dart';
import 'package:byomug/widgets/card.dart';

class RegistrationPage extends StatefulWidget {
  RegistrationPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

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
                backgroundColor: Colors.white
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