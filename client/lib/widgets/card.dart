import 'package:flutter/material.dart';

class FormCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0.0, 15.0),
              blurRadius: 15.0),
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0.0, -10.0),
              blurRadius: 10.0),
          ]),
      child: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Login",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 26,
                  fontFamily: "AT",
                  letterSpacing: .6)
            ),
            SizedBox(
              height: 16,
            ),
            Text("Username",
                style: TextStyle(
                  color: Colors.green,
                  fontFamily: "AT",
                  fontSize: 20)
            ),
            TextField(
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green)
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 2.0)
                ),
                hintText: "Username",
                hintStyle: TextStyle(color: Colors.green, fontSize: 12.0)),
            ),
            SizedBox(
              height: 16,
            ),
            Text("Password",
                style: TextStyle(
                  color: Colors.green,
                  fontFamily: "AT",
                  fontSize: 20)),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green)
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 2.0)
                ),
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.green, fontSize: 12.0)),
            ),
            SizedBox(
              height: 36,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: Colors.green,
                    fontFamily: "AT",
                    fontSize: 16),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}