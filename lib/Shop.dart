import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'Dashboard.dart';
import 'FiftyFifty.dart';
import 'VideoPageFiles/home_screen.dart';



class Shop extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: WebViewLoad()
        )
    );
  }
}



class WebViewLoad extends StatefulWidget {

  WebViewLoadUI createState() => WebViewLoadUI();

}

class WebViewLoadUI extends State<WebViewLoad>{

  final topAppBar = AppBar(
    elevation: 0.1,
    backgroundColor: Color.fromRGBO(31, 66, 146, 1.0),
    title: Text("Fife Flyers Shop"),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.list),
        onPressed: () {},
      )
    ],
  );

  get makeBottom => Container(
    height: 55.0,
    child: BottomAppBar(
      color: Color.fromRGBO(31, 66, 146, 1.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // Home Button
          IconButton(
            icon: Icon(Icons.home_outlined, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Dashboard()),
              );
            },
          ),

          // Shop Button
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Shop()),
              );
            },
          ),

          Image.asset(
            'assets/images/Logo.png',
            width: 70,
          ),

          // Video Library Button
          IconButton(
            icon: Icon(Icons.video_library_outlined, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),

          // Profile Button
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FiftyFifty()));
            },
            child: Image.asset(
              'assets/images/5050_outlined.png',
              width: 20,
            ),
          ),
        ],
      ),
    ),
  );



  @override

  Widget build(BuildContext context) {

    return Scaffold(
      appBar:  topAppBar,
      body: WebView(
        initialUrl: 'https://www.fifeflyers.co.uk/app/shop/shop',
        javascriptMode: JavascriptMode.unrestricted,

      ),
      bottomNavigationBar: makeBottom,
    );
  }
}

