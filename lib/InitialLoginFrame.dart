import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {

  final Function goToLogin;
  final Function goToRegister;

  HomeWidget({this.goToLogin, this.goToRegister});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          children: <Widget> [

            SizedBox(
              height: 100,
            ),

            Row(

                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget> [

                  InkWell(

                    onTap: () {
                      goToLogin();
                    },

                    child: Text(
                      'LOGIN',
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
                  ),

                  InkWell(onTap: () {
                    goToRegister();
                  },
                    child: Text(
                      'REGISTER',
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
                  ),
                ]
            ),

          ]
      ),




      // If you need to make the background stand out. color: Colors.red,
    );
  }
}
