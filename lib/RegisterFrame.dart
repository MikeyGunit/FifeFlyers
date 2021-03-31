import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';

import 'Dashboard.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  final Function cancelToHome;

  Register({this.cancelToHome});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _termsAgreed = false;
  bool Loadingvisible = false;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordreenterController = TextEditingController();

  Future createUser() async {
    setState(() {
      // Display the loading circle whilst loading. Would be good to replace this with a flyers logo loading bar one day.
      Loadingvisible = true;
    });

    // Save the input from the textfield into appropriately named strings.
    String username = usernameController.text;
    String password = passwordController.text;
    String passwordreenter = passwordreenterController.text;

    // The url for the php script to be executed.
    var url =
        'https://www.fifeflyers.co.uk/NewWebsite/App/Scripts/register_user.php';

    // Store all data with Param names.
    var data = {
      'username': username,
      'password': password,
      'passwordreenter': passwordreenter
    };

    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If the Response Message is Matched.
    if (message == 'Login Matched') {
      await FlutterSession().set('token', username);

      // Hiding the CircularProgressIndicator.
      setState(() {
        Loadingvisible = false;
      });

      // Send them to the dashboard.
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Dashboard()));
    } else {
      // If Username or Password did not Matched.
      // Hiding the CircularProgressIndicator.
      setState(() {
        Loadingvisible = false;
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: <Widget>[
          Text(
            'CREATE AN ACCOUNT',
            style: TextStyle(
                color: Color.fromRGBO(250, 208, 26, 1.0),
                fontSize: 40,
                fontFamily: 'CaptainAmerican',
                shadows: [
                  Shadow(
                    blurRadius: 2.0,
                    color: Colors.blue,
                    offset: Offset(1.0, 1.0),
                  )
                ]),
          ),
          TextField(
            controller: usernameController,
            decoration: InputDecoration(
              hintText: 'Enter Username',
              hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.8),
                decorationColor: Colors.red,
              ),
              focusColor: Colors.white,
            ),
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.0,
            ),
          ),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.8),
                decorationColor: Colors.red,
              ),
              focusColor: Colors.white,
            ),
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.0,
            ),
          ),
          TextField(
            controller: passwordreenterController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Re-enter Password',
              hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.8),
                decorationColor: Colors.red,
              ),
              focusColor: Colors.white,
            ),
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.0,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Checkbox(
                  activeColor: Colors.blue,
                  value: _termsAgreed,
                  onChanged: (newValue) {
                    setState(() {
                      _termsAgreed = newValue;
                    });
                  }),
              Text(
                'Agree to Terms and Conditions',
                style: TextStyle(
                  color: Color.fromRGBO(31, 66, 146, 1.0),
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              InkWell(
                onTap: () {
                  widget.cancelToHome();
                },
                child: Text(
                  'CANCEL',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  createUser();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      30.0,
                    ),
                  ),
                  child: Text(
                    'REGISTER',
                    style: TextStyle(
                        color: Color.fromRGBO(250, 208, 26, 1.0),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 2.0,
                            color: Color.fromRGBO(31, 66, 146, 1.0),
                            offset: Offset(1.0, 1.0),
                          )
                        ]),
                  ),
                ),
              ),
            ],
          ),
          Visibility(
              visible: Loadingvisible,
              child: Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: CircularProgressIndicator())),
        ]),
      ),
    );
  }
}
