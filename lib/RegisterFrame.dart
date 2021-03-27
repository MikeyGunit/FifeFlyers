import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function cancelToHome;

  Register({this.cancelToHome});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _termsAgreed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            children: <Widget> [
              Text(
                'CREATE AN ACCOUNT',
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
              ),

              TextField(
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
                children: <Widget>[Checkbox(
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
                      color: Colors.blue,
                      fontSize: 16.0,
                    ),),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(onTap: () {
                    widget.cancelToHome();
                  },
                    child: Text('CANCEL',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),

                  Container(
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

                      child: Text('SIGN UP',
                        style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                blurRadius: 2.0,
                                color: Colors.black,
                                offset: Offset(1.0, 1.0),
                              )
                            ]
                        ),
                      )),

                ],)
            ]
        ),
      ),
    );

  }
}

