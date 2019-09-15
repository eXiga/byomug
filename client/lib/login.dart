import 'package:byomug/decorations/gradient-box-decoration.dart';
import 'package:byomug/home-client.dart';
import 'package:byomug/widgets/alert.dart';
import 'package:flutter/material.dart';
import 'package:byomug/widgets/card.dart';
import 'package:byomug/models/client.dart';
import 'package:byomug/services/user-service.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final userNameFieldController = TextEditingController(text: "akostenich@pochta.com");
  final passwordFieldController = TextEditingController(text: "123321");
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
                  decoration: GradientBoxDecoration.build(
                    Colors.greenAccent, 
                    Colors.green
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () async {
                        setState(() {
                          isLoading = true;
                        });

                        var string = Client(
                          username: this.userNameFieldController.text,
                          password: this.passwordFieldController.text
                        ).toJson();

                        try {
                          var user = await UserService.authenticateUser(string);
                          setState(() {
                            isLoading = false;
                          });
                          if (user.isHost) {
                            Navigator.pushReplacementNamed(context, '/home_host');
                          } else {
                            Navigator.pushReplacementNamed(
                              context,
                              '/home_client',
                              arguments: HomeClientScreenArguments(user)
                            );
                          }
                        } catch (e) {
                          setState(() {
                            isLoading = false;
                          });
                          showDialog(
                            context: context,
                            builder: (context) {
                              return ErrorAlert();
                            }
                          );
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

