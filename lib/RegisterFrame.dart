import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
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
  // Terms agreed checkbox.
  bool _termsAgreed = false;

  // Loading indicator variables.
  bool loadingVisible = false;
  bool privacypolicyVisible = false;

  TapGestureRecognizer _PrivacyPolicy;

  @override
  void dispose() {
    _PrivacyPolicy.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _PrivacyPolicy = TapGestureRecognizer()
      ..onTap = () {
        if (privacypolicyVisible == true) {
          setState(() {
            // Display the loading circle whilst loading. Would be good to replace this with a flyers logo loading bar one day.
            privacypolicyVisible = false;
          });
        } else {
          setState(() {
            // Display the loading circle whilst loading. Would be good to replace this with a flyers logo loading bar one day.
            privacypolicyVisible = true;
          });
        }
      };
  }

  // Register variables.
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordreenterController = TextEditingController();

  Future createUser() async {
    setState(() {
      // Display the loading circle whilst loading. Would be good to replace this with a flyers logo loading bar one day.
      loadingVisible = true;
    });

    // Save the input from the textfield into appropriately named strings.
    String username = usernameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String passwordreenter = passwordreenterController.text;

    // The url for the php script to be executed.
    var url =
        'https://www.fifeflyers.co.uk/NewWebsite/App/Scripts/register_user.php';

    // Store all data with Param names.
    var data = {
      'username': username,
      'email': email,
      'password': password,
      'passwordreenter': passwordreenter,
      'termsAgreed': _termsAgreed
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
        loadingVisible = false;
      });

      // Send them to the dashboard.
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Dashboard()));
    } else {
      // If Username or Password did not Matched.
      // Hiding the CircularProgressIndicator.
      setState(() {
        loadingVisible = false;
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
        padding: const EdgeInsets.all(40.0),
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
                    color: Color.fromRGBO(31, 66, 146, 1.0),
                    offset: Offset(1.0, 1.0),
                  )
                ]),
          ),
          TextField(
            controller: usernameController,
            decoration: InputDecoration(
              hintText: 'Username',
              hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.8),
              ),
              focusColor: Colors.white,
            ),
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.0,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: 'Email',
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
          SizedBox(
            height: 10,
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
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Checkbox(
                    activeColor: Color.fromRGBO(31, 66, 146, 1.0),
                    hoverColor: Colors.red,
                    value: _termsAgreed,
                    onChanged: (newValue) {
                      setState(() {
                        _termsAgreed = newValue;
                      });
                    }),
                RichText(
                  text: TextSpan(
                    text: 'I Agree to ',
                    style: TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontSize: 16.0,
                        shadows: [
                          Shadow(
                            blurRadius: 2.0,
                            color: Color.fromRGBO(31, 66, 146, 1.0),
                            offset: Offset(1.0, 1.0),
                          )
                        ]),
                    children: [
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                blurRadius: 2.0,
                                color: Color.fromRGBO(31, 66, 146, 1.0),
                                offset: Offset(1.0, 1.0),
                              )
                            ]),
                        recognizer: _PrivacyPolicy,
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
                    fontFamily: 'CaptainAmerican',
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
                    color: Color.fromRGBO(31, 66, 146, 1.0),
                    borderRadius: BorderRadius.circular(
                      30.0,
                    ),
                  ),
                  child: Text(
                    'REGISTER',
                    style: TextStyle(
                      fontFamily: 'CaptainAmerican',
                      color: Colors.white,
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Visibility(
              visible: loadingVisible,
              child: Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: CircularProgressIndicator())),
          Visibility(
            visible: privacypolicyVisible,
            child: Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(children: <Widget>[
                    Text(
                      'PRIVACY POLICY',
                      style: TextStyle(
                        fontFamily: 'CaptainAmerican',
                        color: Colors.white,
                        fontSize: 30.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Your privacy is important to us.",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    Text(
                      "We are committed to being upfront about our privacy practices. This Privacy Policy describes how we use and protect your personal data.",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "This Privacy Policy relates to the Fife Flyers Application (‘App’)  and e-commerce services operated by Fife Flyers Limited, a company registered in Scotland with company number SC167157 with registered office Fife Ice Arena, Rosslyn Street, Kirkcaldy, Fife, KY1 3HS.",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "These Privacy Terms apply to all Services including all websites, mobile applications owned and operated by us or our affiliates that link to these Terms and all related online and offline services including any social media pages.",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "By using or accessing our Services provided in connection with our business (the “Services”), you confirm your agreement to be bound by this Privacy Policy. If you do not agree to Privacy Policy, please do not use or access the Services.",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Unless we explain otherwise in this policy, the words and phrases used in this policy have the same meaning as in the Terms and Conditions of Use of our Services.",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "We use information collected about you only as permitted in this Privacy Policy.",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "We are not responsible for any data you provide to or is collected by Organisations through your use of our Services. We are not responsible for the privacy practices or the content of Organisation’s services. Therefore, please read carefully any Organisation’s privacy policies before either agreeing to their terms.",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "By providing information to us in any way by using our Services, you expressly agree to this Privacy Policy.",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "DATA CONTROLLER",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "By registering with the Platform and our Services you agree to provide us with personal data which we can use to promote our e-commerce services to you and other Services from time to time.",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "We act as the data controller of this personal data. We are responsible for its security and for ensuring that we use it only for the purposes outlined in this Privacy Notice.",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "If you have any questions about this privacy notice, including any requests to exercise your legal rights, please contact us using the details set out below.",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "DATA PROCESSOR",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "We also act as the Data Processor in the following services and any others that may arise in the future:",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "- Personal information provided by Organsations and loaded up on the Fife Flyers App & Web Platform.",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "- Personal information collected by Organisations.",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "- Images or content published by Users.",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "- Users’ personal data provided by Users and used by Organisations while they use the Services.",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "- User or Organisation communications.",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "The Controller of the data provided in relation to those services shall be the Organisation who must comply with the data protection regulations, must have obtained consent from the data subjects for processing their personal data and must have applied all the guarantees required for processing their personal data. We shall handle the data according to the provisions of the applicable personal data protection regulations in force, including the standard contractual clauses set forth by the European Commission.",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "CONTACT DETAILS",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "If you need to get hold of us for any reason in connection with your personal data, please email us at info@fifeflyers.co.uk. Our Registered Office is: Fife Ice Arena, Rosslyn Street, Kirkcaldy, Fife, KY1 3HS. Our Registered Company Number is: SC167157",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "INFORMATION WE COLLECT",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "In order to use our Services, you need to provide us with personal information including but not limited to: Users e-mail address, name and some contact information.",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "HOW DO WE COLLECT INFORMATION",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "We collect information that you voluntarily provide to us during your use of the Services about yourself. In addition to information that you voluntarily provide to us, we may also collect information about your usage of our Services and may use cookies to do this (our cookie policy is found here).",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "We may also gather information from third party applications, social networking sites (such as Facebook) or other websites (such as a promotion partner) that you connect to us from.",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "We may also obtain technical data including location information you provide in your profile or your IP address. We may use and store information about your location to provide features and to improve and customise our services. We may collect, user and share aggregated data, such as statistical or demographic data for any purpose. Aggregated Data may be derived from your personal data but is not considered personal data in law as this data does not directly or indirectly reveal your identity. For example, we may aggregate your usage data.",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "HOW DO WE USE THIS INFORMATION",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "The Users’ data provided to us through any means so that it can render the Services required by them are processed for the following purposes:",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "- Enable Users to rapidly and easily search for Hockey related products and Services.",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "- Advertise the services and products and our Services.",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "- Provide Users with information about Fife Flyers Official Offers and our Services.",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "- Create a community of Users.",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "- Provide Users with assistance including by telephone, e-mail and other forms of communication.",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "- Maintain regular communication with the Users through any means, including social media and instant messaging.",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "- Record the telephone calls with the aim of ensuring the service quality and monitoring how the incidents are resolved.",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "- Provide Users with additional Services from time to time.",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "We use your information to provide better Service features and functionality and to optimise and personalise your user experience.",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "We also use User information to understand how we can improve and develop our Services for you.",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "We use your information to contact you with confirmations, notifications or alerts you have requested, such as email newsletters or communication.",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "We may disclose your information where necessary to enforce our Terms and Conditions or other agreements, or to a prospective buyer or ultimate buyer if our business is sold. We may also disclose your information if necessary to prevent, detect or prosecute illegal or suspected illegal activities or to prevent other damage or in response to a legal action against us or to enforce our rights and claims. The Users’ data provided to us through any means shall also be processed for the following purposes:",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "- Analysing the data for training and/or statistical purposes. Carry out the basic activities to analyse the content of the information provided and draft the profiles to appropriately manage the activities and services provided by us.",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "- Send electronic communications, promotions and information about our Service.",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "HOW WE KEEP PERSONAL INFORMATION SECURE AND SAFE",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "We follow generally accepted standards to protect personal information submitted to us, both during transmission and after it is received. Your account information is protected by a password. It is important that you protect against unauthorized access to your account and information by choosing your password carefully and by keeping your password and computer secure, such as by signing out after using the platform. If you have any questions about the security of your personal information, you can contact us as outlined in this Privacy Policy.",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Although we do our best to protect your Personal Information, the transmission of information via the internet can never be completely secure and we are therefore unable to guarantee the security of the information which you share with us at your own risk. ",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "The information we collect from you is stored on secure servers. Any Personal Information we collect from may be stored in services within or outside the EU. Regardless of location, we ensure that adequate technical and organisational measures are in place to protect the security of any information we store on our servers.",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "If you would like to manage, change or delete personal User information, you can do so via your User Account or by contacting us. Upon request we will provide you with information about whether we hold any of your personal information. If you want an Organisation to manage, change or delete any personal information you have provided to them via our Platform, you can do so by contacting Organisations directly.",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "ORGANISATIONS RESPONSIBILITIES",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "If you are an Organisation using our Services, you may receive and determine what to do with certain personal information, such as when communicating with or entering into transactions with Users. This means you process personal information and, to the extent do so, under EU law, you are an independent controller of data relating to Users that you communicate with through our platform.",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "You are responsible for protecting User personal information you receive or process and complying with all relevant legal requirements when you use our Platform. This includes applicable data protection and privacy laws that govern the ways in which you can use a User’s information. Such laws may require that you post, and comply with, your own privacy policy, which must be accessible to Users you interact with and compatible with this policy and our Terms & Conditions. For more information on the General Data Protection Regulation, see more resources at https://gdpr-info.eu.",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "As a data controller, to the extent that you process user personal information outside of the Services, you may be required under applicable data protection and privacy laws to honour requests for data access, portability, correction, deletion, and objections to processing. Also, if you disclose personal information without the Users proper consent, you are responsible for that unauthorised disclosure. This includes, for example, disclosures you make or unintentional data breaches. You may not use Users information for unsolicited commercial messages or unauthorised transactions. Without the Users consent, and subject to our other applicable policies and laws, you may not add any User to your email or physical mailing list, use personal information for marketing, or obtain or retain any payment information. Please bear in mind that you’re responsible for knowing the standard of consent required in any given instance.",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "If we are found to be joint data controllers of personal information, and if we are sued, fined, or otherwise incur expenses because of something that you did as a joint data controller of User personal information, you agree to indemnify us for the expenses it occurs in connection with your processing of such personal information.",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "WITHDRAWING CONSENT",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Where a User has provided consent, you have the right to withdraw your consent to our processing of your information and your use of the Platform. For example, you can withdraw your consent to email marketing by using the unsubscribe link in such communications or by changing your account settings. You can choose to withdraw your consent to our processing of your information and your use of the Services at any time by closing your User account or by contacting us request that your personal information be deleted, except for information that we are required to retain.",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Please note if you have provided consent for Organisations to use your personal via our Platform or Services you need to contact Organisations directly to withdrew your consent of them to use your information.",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "HOW CAN I ACCESS OR MANAGE MY PERSONAL INFORMATION",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "You can manage most of your Personal Information and subscription preferences from your User account or Organisation Account.",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "PRIVACY TERMS",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "We reserve the right, in our sole discretion, to change or modify these Terms at any time. It is your responsibility to check the Terms periodically because any changes will be binding on you. By continuing to access or use the Services after those revisions become effective, you agree to be bound by the revised Terms.",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Last Updated April 2021",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ]),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
