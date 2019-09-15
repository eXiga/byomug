import 'package:byomug/decorations/gradient-box-decoration.dart';
import 'package:byomug/widgets/alert.dart';
import 'package:flutter/material.dart';
import 'package:byomug/widgets/card.dart';
import 'package:byomug/models/client.dart';
import 'package:byomug/services/user-service.dart';

class RegistrationPage extends StatefulWidget {
  RegistrationPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  final userNameFieldController = TextEditingController();
  final passwordFieldController = TextEditingController();
  var isLoading = false;

  @override
  void dispose() {
    this.userNameFieldController.dispose();
    this.passwordFieldController.dispose();
    super.dispose();
  }

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
                          name: this.userNameFieldController.text,
                          password: this.passwordFieldController.text
                        ).toJson();

                        try {
                          var user = await UserService.registerUser(string);
                          setState(() {
                            isLoading = false;
                          });
                          Navigator.pushReplacementNamed(context, '/home_client');
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

  @override
  Widget build(BuildContext context) {
    return _pageToDisplay;
  }
}