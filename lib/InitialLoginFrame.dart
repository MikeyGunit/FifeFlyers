import 'package:flutter/material.dart';
import 'package:FifeFlyers/Nav.dart';

class HomeWidget extends StatelessWidget {
  final Function goToLogin;
  final Function goToRegister;

  HomeWidget({this.goToLogin, this.goToRegister});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        SizedBox(
          height: 25,
        ),
        Image.asset(
          "assets/images/Logo.png",
          width: 300,
        ),
        SizedBox(
          height: 25,
        ),
        Container(
          width: MediaQuery.of(context).size.width * .75,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                // Sign in Text
                InkWell(
                  onTap: () {
                    goToLogin();
                  },
                  child: Text(
                    'SIGN-IN',
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
                        ]),
                  ),
                ),

                // Register Text
                InkWell(
                  onTap: () {
                    goToRegister();
                  },
                  child: Text(
                    'REGISTER',
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
                        ]),
                  ),
                ),
              ]),
        ),
        SizedBox(
          height: 25,
        ),
        Align(
          alignment: Alignment.center,
          child: InkWell(

            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Nav()));
            },
            child: Text(
              "CONTINUE AS A GUEST",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
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
      ]),

      // If you need to make the background stand out. color: Colors.red,
    );
  }
}
