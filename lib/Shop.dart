import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:  topAppBar,
      body: WebView(
        initialUrl: 'https://www.fifeflyers.co.uk/app/shop/shop',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}