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
             height: 25,
           ),

            Image.asset("assets/images/Logo.png",
           width: 300,),

            SizedBox(
              height: 25,
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
                          color: Color.fromRGBO(250, 208, 26, 1.0),
                          fontSize: 40,
                          fontFamily: 'CaptainAmerican',
                          shadows: [
                            Shadow(
                              blurRadius: 2.0,
                              color: Color.fromRGBO(31, 66, 146, 1.0),
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
                          color: Color.fromRGBO(250, 208, 26, 1.0),
                          fontSize: 40,
                          fontFamily: 'CaptainAmerican',
                          shadows: [
                            Shadow(
                              blurRadius: 2.0,
                              color: Color.fromRGBO(31, 66, 146, 1.0),
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
