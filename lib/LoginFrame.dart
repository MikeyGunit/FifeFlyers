import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_session/flutter_session.dart';


class Login extends StatefulWidget {

  final Function cancelToHome;
  final Function goToLostPassword;

  Login({this.cancelToHome, this.goToLostPassword});

  @override
  _LoginState createState() => _LoginState();


}

class _LoginState extends State<Login> {


  // For CircularProgressIndicator.
  bool visible = false ;

  // Getting value from TextField widget.
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Future userLogin() async{

    // Showing CircularProgressIndicator.
    setState(() {
      visible = true ;
    });

    // Getting value from Controller
    String username = usernameController.text;
    String password = passwordController.text;

    // SERVER LOGIN API URL
    var url = 'https://www.fifeflyers.co.uk/NewWebsite/App/Scripts/login_user.php';

    // Store all data with Param Name.
    var data = {'username' : username, 'password' : password};

    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If the Response Message is Matched.
    if(message == 'Login Matched')
    {

      await FlutterSession().set('token', username);

      // Hiding the CircularProgressIndicator.
      setState(() {
        visible = false;
      });

      // Navigate to Profile Screen & Sending Email to Next Screen.
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Dashboard())
      );
    }else{

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
        padding: const EdgeInsets.all(8.0),
        child: Column(
            children: <Widget> [
              Text(
                'SIGN IN',
                style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 40,
                    fontFamily: 'CaptainAmerican',
                    shadows: [
                      Shadow(
                        blurRadius: 2.0,
                        color: Colors.blue,
                        offset: Offset(1.0, 1.0),
                      )
                    ]
                ),
              ),

              TextField(
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
                controller: usernameController,
                autocorrect: true,
              ),

              TextField(
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
                controller: passwordController,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Checkbox(
                    activeColor: Colors.blue,
                    value: _rememberPassword,
                    onChanged: (newValue) {
                      setState(() {
                        _rememberPassword = newValue;

                      });

                    }),


                  Text(
                    'Remember Password',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16.0,
                    ),
                  ),

                ],
              ),

              SizedBox(
                width: 100,
                child: RaisedButton(
                  onPressed: userLogin,
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(9, 9, 9, 9),
                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  child: Text('LOGIN',
                      style: TextStyle(
                          fontSize: 20.0,
                          shadows: [
                            Shadow(
                              blurRadius: 2.0,
                              color: Colors.yellow,
                              offset: Offset(1.0, 1.0),
                            )
                          ])),

                ),
              ),

              Visibility(
                  visible: visible,
                  child: Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: CircularProgressIndicator()
                  )
              ),

              LoginLower(),

            ]
        ),
      ),
    );

  }


}

class LoginLower extends StatelessWidget {

  final Function cancelToHome;
  final Function goToLostPassword;

  LoginLower({this.cancelToHome, this.goToLostPassword});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[

        InkWell(

          onTap: () {
            print("test");
            goToLostPassword();


          },

          child: Text('Forgotten password?',
            style: TextStyle(
              color: Colors.yellow,
            ),
          ),
        ),

        InkWell(

          onTap: () {
            cancelToHome();
          },
          child:  Text('Home Screen',
            style: TextStyle(
              color: Colors.yellow,
            ),
          ),
        ),

      ],
    );

  }
}
