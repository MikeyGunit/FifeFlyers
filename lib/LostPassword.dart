import 'package:flutter/material.dart';
import 'Dashboard.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_session/flutter_session.dart';

class LostPassword extends StatefulWidget {
  final Function cancelToHomeScreen;

  LostPassword({this.cancelToHomeScreen});

  @override
  _LostPasswordState createState() => _LostPasswordState();
}

class _LostPasswordState extends State<LostPassword> {
  final emailController = TextEditingController();
  bool loadingVisible = false;

  //bool responseVisible = false;

  //String responseMessage = "";
  //String responseColor = "";

  Future lookUpUser() async {
    setState(() {
      // Display the loading circle whilst loading. Would be good to replace this with a flyers logo loading bar one day.
      loadingVisible = true;
    });

    String email = emailController.text;

    var url =
        'https://www.fifeflyers.co.uk/NewWebsite/App/Scripts/forgottenPassword.php';

    var data = {
      'email': email,
    };

    var response = await http.post(url, body: json.encode(data));

    var message = jsonDecode(response.body);

    if (message == 'Valid Email') {
      // Hiding the CircularProgressIndicator.
      setState(() {
        loadingVisible = false;
        //responseVisible = true;

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text("An E-mail has been sent containing a temporary new password."),
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
      });

      // Send them to the dashboard.
      //Navigator.push(
      // context, MaterialPageRoute(builder: (context) => Dashboard()));
    } else {
      // If Username or Password did not Matched.
      // Hiding the CircularProgressIndicator.
      setState(() {
        loadingVisible = false;

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text("Please enter a valid email address."),
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

        /* Add this in later.
        responseVisible = true;

        responseMessage = "Invalid E-mail address. Please enter the address you registered the account with.";
        responseColor = "";

         */
      });
      // Showing Alert Dialog with Response JSON Message.
      /* showDialog(
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
      );*/
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                'FORGOTTEN PASSWORD',
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
                  ],
                ),
              ),

              // Username Field
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
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
              ),

              // Forgotten Password response. Add this in later.
              /* Visibility(
                visible: responseVisible,
                child: Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: Text(
                    responseMessage,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        shadows: [
                          Shadow(
                            blurRadius: 2.0,
                            color: Colors.lightGreen,
                            offset: Offset(1.0, 1.0),
                          )
                        ]),
                  ),
                ),
              ),

               */

              // Password Field
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Please enter your email address.',
                  style:
                      TextStyle(color: Colors.white, fontSize: 16.0, shadows: [
                    Shadow(
                      blurRadius: 2.0,
                      color: Color.fromRGBO(31, 66, 146, 1.0),
                      offset: Offset(1.0, 1.0),
                    )
                  ]),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  lookUpUser();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(31, 66, 146, 1.0),
                    borderRadius: BorderRadius.circular(
                      30.0,
                    ),
                  ),
                  child: Text(
                    'Reset Password',
                    style: TextStyle(
                      fontFamily: 'CaptainAmerican',
                      color: Colors.white,
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              InkWell(
                onTap: () {
                  widget.cancelToHomeScreen();
                },
                child: Text(
                  'Home Screen',
                  style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      shadows: [
                        Shadow(
                          blurRadius: 2.0,
                          color: Color.fromRGBO(31, 66, 146, 1.0),
                          offset: Offset(1.0, 1.0),
                        )
                      ]),
                ),
              ),
              Visibility(
                  visible: loadingVisible,
                  child: Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: CircularProgressIndicator())),
            ],
          ),
        ),
      ),
    );
  }
}
