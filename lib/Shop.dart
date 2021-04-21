import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Shop extends StatelessWidget {

  static Future<String> get _url async {
    await Future.delayed(Duration(seconds: 1));
    return 'https://www.fifeflyers.co.uk/app/shop/shop';
  }

  final topAppBar = AppBar(
    elevation: 0.1,
    backgroundColor: Color.fromRGBO(31, 66, 146, 1.0),
    title: Text("Fife Flyers Shop"),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, home: Scaffold(appBar: topAppBar, body: Center(
      child:FutureBuilder(
          future: _url,
          builder: (BuildContext context, AsyncSnapshot snapshot) => snapshot.hasData
              ? WebViewWidget(url: snapshot.data,)
              : CircularProgressIndicator()),
    ),),);
  }
}

class WebViewWidget extends StatefulWidget {
  final String url;
  WebViewWidget({this.url});

  @override
  _WebViewWidget createState() => _WebViewWidget();
}

class _WebViewWidget extends State<WebViewWidget> {
  WebView _webView;
  @override
  void initState() {
    super.initState();
    _webView = WebView(
      initialUrl: widget.url,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _webView = null;
  }

  @override
  Widget build(BuildContext context) => _webView;
}
