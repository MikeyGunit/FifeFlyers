import 'package:flutter/material.dart';

import 'Dashboard.dart';
import 'DboardEntry.dart';
import 'FiftyFifty.dart';
import 'Shop.dart';
import 'VideoPageFiles/home_screen.dart';

class DetailPage extends StatelessWidget {
  final DboardEntry dboardEntry;
  final DboardAppEntry dboardAppEntry;

  DetailPage({Key key, this.dboardEntry, this.dboardAppEntry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final topContent = Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: NetworkImage(
                    "https://www.fifeflyers.co.uk/NewWebsite/App/Images/News/Hero/" +
                        dboardEntry.heroImage),
                fit: BoxFit.fill,
              ),
            )),
        /* Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(31, 66, 146, 1.0)),
          child: Center(
            child: topContentText,
          ),
        ),

        */
      ],
    );

    final bottomContentText = Column(children: <Widget>[
      Text(dboardEntry.title),
      Text(dboardEntry.text),
    ]);

    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Color.fromRGBO(31, 66, 146, 1.0),
      title: Text(dboardEntry.title),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.list),
          onPressed: () {},
        )
      ],
    );

    final makeBottom = Container(
      height: 55.0,
      child: BottomAppBar(
        color: Color.fromRGBO(31, 66, 146, 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // Home Button
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboard()),
                );
              },
            ),

            // Shop Button
            IconButton(
              icon: Icon(Icons.shopping_cart_outlined, color: Colors.white),
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

    return Scaffold(
      appBar: topAppBar,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[topContent, bottomContentText],
        ),
      ),
      bottomNavigationBar: makeBottom,
    );
  }
}

class DetailPage2 extends StatelessWidget {
  final DboardAppEntry dboardAppEntry;

  DetailPage2({Key key, this.dboardAppEntry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final topContent = Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: NetworkImage(
                    "https://www.fifeflyers.co.uk/NewWebsite/App/Images/News/Hero/" +
                        dboardAppEntry.heroImage),
                fit: BoxFit.fill,
              ),
            )),
        /* Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(31, 66, 146, 1.0)),
          child: Center(
            child: topContentText,
          ),
        ),

        */
      ],
    );

    final bottomContentText = Column(children: <Widget>[
      Text(dboardAppEntry.title, style: TextStyle(fontSize: 30)),
      Text(dboardAppEntry.text),
    ]);

    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Color.fromRGBO(31, 66, 146, 1.0),
      title: Text(dboardAppEntry.title),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.list),
          onPressed: () {},
        )
      ],
    );

    final makeBottom = Container(
      height: 55.0,
      child: BottomAppBar(
        color: Color.fromRGBO(31, 66, 146, 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // Home Button
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboard()),
                );
              },
            ),

            // Shop Button
            IconButton(
              icon: Icon(Icons.shopping_cart_outlined, color: Colors.white),
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

    return Scaffold(
      appBar: topAppBar,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[topContent, bottomContentText],
        ),
      ),
      bottomNavigationBar: makeBottom,
    );
  }
}
