import 'package:flutter/material.dart';
import 'LoginFrame.dart';
import 'video_widget.dart';
import 'RegisterFrame.dart';
import 'LostPassword.dart';
import 'InitialLoginFrame.dart';

class MenuFrame extends StatelessWidget {
  PageController pageController = PageController();

  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      VideoWidget(),
      Material(
        color: Colors.transparent,
        child: Container(
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: pageController,
                    children: <Widget>[
                      HomeWidget(
                        goToLogin: () {
                          pageController.animateToPage(2,
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeIn);
                        },
                        goToRegister: () {
                          pageController.animateToPage(1,
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeIn);
                        },
                      ),
                      Register(
                        cancelToHome: () {
                          pageController.animateToPage(0,
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeIn);
                        },
                      ),
                      Login(
                        goToLostPassword: () {
                          pageController.animateToPage(3,
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeIn);
                        },
                        cancelToHome: () {
                          pageController.animateToPage(0,
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeIn);
                        },
                      ),
                      LostPassword(
                        cancelToHomeScreen: () {
                          pageController.animateToPage(0,
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeIn);
                        },
                      ),
                    ],
                  ),
                ),

                //Expanded(
                Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("REPORT A BUG",
                            style: TextStyle(
                              color: Color.fromRGBO(250, 208, 26, 1.0),
                              fontSize: 12,
                              fontFamily: 'CaptainAmerican',
                              shadows: [
                                Shadow(
                                  blurRadius: 2.0,
                                  color: Color.fromRGBO(31, 66, 146, 1.0),
                                  offset: Offset(1.0, 1.0),
                                )
                              ],
                            ),),

                          Text("BUILD: 2.0.2",
                            style: TextStyle(
                              color: Color.fromRGBO(250, 208, 26, 1.0),
                              fontSize: 12,
                              fontFamily: 'CaptainAmerican',
                              shadows: [
                                Shadow(
                                  blurRadius: 2.0,
                                  color: Color.fromRGBO(31, 66, 146, 1.0),
                                  offset: Offset(1.0, 1.0),
                                )
                              ],
                            ),),
                        ]),
                  ),
                ),

                //),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
