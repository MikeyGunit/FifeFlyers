import 'package:flutter/material.dart';
import 'DboardEntry.dart';

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

    final bottomContentText = Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(children: <Widget>[

        Text(dboardEntry.title,
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
          ],
        ),),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(dboardEntry.text),
        ),
      ]),
    );

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

    return Scaffold(
      appBar: topAppBar,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[topContent, bottomContentText],
        ),
      ),
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


    return Scaffold(
      appBar: topAppBar,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[topContent, bottomContentText],
        ),
      ),
    );
  }
}