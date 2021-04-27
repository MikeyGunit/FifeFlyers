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
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
