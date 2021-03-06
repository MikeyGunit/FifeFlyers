import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Dashboard.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_session/flutter_session.dart';

import 'Nav.dart';

class Login extends StatefulWidget {
  final Function cancelToHome;
  final Function goToLostPassword;

  Login({this.cancelToHome, this.goToLostPassword});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // For CircularProgressIndicator.
  bool visible = false;

  // Getting value from TextField widget.
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future userLogin() async {
    // Showing CircularProgressIndicator.
    setState(() {
      visible = true;
    });

    // Getting value from Controller
    String email = emailController.text;
    String password = passwordController.text;

    // SERVER LOGIN API URL
    var url =
        'https://www.fifeflyers.co.uk/NewWebsite/App/Scripts/login_user.php';

    // Store all data with Param Name.
    var data = {'email': email, 'password': password};

    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If the Response Message is Matched.
    if (message == 'Login Matched') {
      await FlutterSession().set('token', email);

      // Hiding the CircularProgressIndicator.
      setState(() {
        visible = false;
      });

      // Send them to the dashboard.
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Nav()));
    } else {
      // If Username or Password did not Matched.
      // Hiding the CircularProgressIndicator.
      setState(() {
        visible = false;
      });

      // Showing Alert Dialog with Response JSON Message.
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(message),
            actions: <Widget>[
              FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  bool _rememberPassword = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: <Widget>[
            Text(
              'SIGN IN',
              style: TextStyle(
                color: Color.fromRGBO(250, 208, 26, 1.0),
                fontSize: 40,
                fontFamily: 'CaptainAmerican',
                shadows: [
                  Shadow(
                    blurRadius: 2.0,
                    color: Color.fromRGBO(31, 66, 146, 1.0),
                    offset: Offset(1.0, 1.0),
                  )
                ],
              ),
            ),

            // Username Field
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter E-mail',
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                ),
                focusColor: Colors.white,
              ),
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
              ),
              controller: emailController,
              autocorrect: true,
            ),

            // Password Field
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                ),
                focusColor: Colors.white,
              ),
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
              ),
              controller: passwordController,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Checkbox(
                      activeColor: Color.fromRGBO(31, 66, 146, 1.0),
                      value: _rememberPassword,
                      onChanged: (newValue) {
                        setState(() {
                          _rememberPassword = newValue;
                        });
                      }),
                  Text(
                    'Remember Password',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        shadows: [
                          Shadow(
                            blurRadius: 2.0,
                            color: Color.fromRGBO(31, 66, 146, 1.0),
                            offset: Offset(1.0, 1.0),
                          )
                        ]),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 100,
              child: RaisedButton(
                onPressed: userLogin,
                color: Color.fromRGBO(31, 66, 146, 1.0),
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(9, 9, 9, 9),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'CaptainAmerican',
                  ),
                ),
              ),
            ),
            Visibility(
                visible: visible,
                child: Container(
                    margin: EdgeInsets.only(bottom: 30),
                    child: CircularProgressIndicator())),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      widget.goToLostPassword();
                    },
                    child: Text(
                      'FORGOTTEN PASSWORD?',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          shadows: [
                            Shadow(
                              blurRadius: 2.0,
                              color: Color.fromRGBO(31, 66, 146, 1.0),
                              offset: Offset(1.0, 1.0),
                            )
                          ]),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      widget.cancelToHome();
                    },
                    child: Text(
                      'HOME SCREEN',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          shadows: [
                            Shadow(
                              blurRadius: 2.0,
                              color: Color.fromRGBO(31, 66, 146, 1.0),
                              offset: Offset(1.0, 1.0),
                            )
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
