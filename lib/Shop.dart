import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dashboard.dart';

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
    backgroundColor: Color.fromRGBO(12, 26, 57, 1.0),
    title: Text("Fife Flyers"),
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
      color: Color.fromRGBO(12, 26, 57, 1.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[

          IconButton(
            icon: Icon(Icons.home, color: Colors.white),

            onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Dashboard()),
              );

            },
          ),

          IconButton(
            icon: Icon(Icons.shopping_cart_outlined, color: Colors.white),
            onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Shop()),
              );

            },
          ),

          IconButton(
            icon: Icon(Icons.video_library_outlined, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.account_box, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  topAppBar,
      body: WebView(
        initialUrl: 'https://www.fifeflyers.co.uk/shop',
        javascriptMode: JavascriptMode.unrestricted,

      ),
      bottomNavigationBar: makeBottom,
    );
  }
}