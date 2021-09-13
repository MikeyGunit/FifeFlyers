import 'DboardEntry.dart';
import 'package:flutter/material.dart';
import 'DetailPage.dart';
import 'Shop.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(primaryColor: Color.fromRGBO(98, 82, 10, 1.0)),
      home: new ListPage(title: 'Lessons'),
    );
  }
}

class ListPage extends StatefulWidget {
  ListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  // Future to create the App Exclusive block.
  Future<List<DboardAppEntry>> _populateNews2() async {
    var appData = await http.get(
        'https://www.fifeflyers.co.uk/NewWebsite/App/Scripts/getAppNews.php');

    var jsonAppData = json.decode(appData.body);

    List<DboardAppEntry> news2 = [];

    for (var u in jsonAppData) {
      var entry = DboardAppEntry(
          id: u["id"],
          date: u["date"],
          mediaType: u["mediaType"],
          title: u["title"],
          text: u["text"],
          heroImage: u["heroImage"],
          videoID: u["videoID"]);

      news2.add(entry);
    }

    print(news2.length);

    return news2;
  }

  // Future to create the news block.
  Future<List<DboardEntry>> _populateNews() async {
    var newsData = await http
        .get('https://www.fifeflyers.co.uk/NewWebsite/App/Scripts/getNews.php');

    var jsonNewsData = json.decode(newsData.body);

    List<DboardEntry> news = [];

    for (var u in jsonNewsData) {
      var entry = DboardEntry(
          id: u["id"],
          date: u["date"],
          mediaType: u["mediaType"],
          title: u["title"],
          text: u["text"],
          heroImage: u["heroImage"]);

      news.add(entry);
    }

    print(news.length);

    return news;
  }

  // Top Navigation Bar
  final topAppBar = AppBar(
    elevation: 0.1,
    backgroundColor: Color.fromRGBO(31, 66, 146, 1.0),
    title: Text("Fife Flyers Ice Hockey Team"),
    //actions:
  );

  get makeBody1 => Column(
        children: [
          Container(
              // Notifications will go here
              ),
          Container(
            child: FutureBuilder(
                future: _populateNews2(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Container(
                      child: Center(child: Text("Loading...")),
                    );
                  } else {
                    return InkWell(
                      /*
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailPage(
                                  dboardAppEntry: snapshot.data[index]),
                                ),);

                      },

                       */

                      child: Container(
                        height: 240,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(25),
                                child: Stack(
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 2,
                                          color:
                                              Color.fromRGBO(31, 66, 146, 1.0),
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        boxShadow: [
                                          new BoxShadow(
                                              color: Color.fromRGBO(
                                                  10, 10, 10, 0.2),
                                              offset: new Offset(0, 10.0),
                                              blurRadius: 15.0,
                                              spreadRadius: 5.0)
                                        ],
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              "https://www.fifeflyers.co.uk/NewWebsite/App/Images/News/App/Hero/" +
                                                  snapshot
                                                      .data[index].heroImage),
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                      width: MediaQuery.of(context).size.width -
                                          50,
                                      //child:
                                      child: ListTile(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => DetailPage2(
                                                  dboardAppEntry:
                                                      snapshot.data[index]),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width -
                                          50,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(
                                            icon: const Icon(
                                                Icons.arrow_back_ios),
                                            color: Colors.yellow,
                                            onPressed: () {},
                                          ),
                                          IconButton(
                                            icon: const Icon(
                                                Icons.arrow_forward_ios),
                                            color: Colors.white,
                                            onPressed: () {},
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    );
                  }
                }),
          ),
        ],
      );

  // Middle section (page content)
  get makeBody => Container(
        child: FutureBuilder(
          future: _populateNews(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(child: Text("Loading...")),
              );
            } else {
              return Column(children: <Widget>[
                // Top "App Exclusive" Hero box.
                makeBody1,

                /* Start of an interactive Dashboard - We'll continue this in the future.

                Container(
                  child: Row( children: <Widget> [
                    Text("Welcome Username"),

                    Text("Flyers Points: 0"),

                  ]
                  ),
                ),

                 */

                SizedBox(
                  height: 10,
                ),

                // Start of the bottom news feed.
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(2.0),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(),
                            borderRadius: BorderRadius.circular(5)),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color.fromRGBO(31, 66, 146, 1.0),
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),

                            leading: Hero(
                              tag: snapshot.data[index].heroImage,
                              child: Image.network(
                                  "https://www.fifeflyers.co.uk/NewWebsite/App/Images/News/Hero/" +
                                      snapshot.data[index].heroImage),
                            ),

                            title: Text(
                              snapshot.data[index].title,
                              style: TextStyle(
                                  color: Color.fromRGBO(250, 208, 26, 1.0),
                                  fontSize: 20,
                                  fontFamily: 'CaptainAmerican',
                                  shadows: [
                                    Shadow(
                                      blurRadius: 2.0,
                                      color: Color.fromRGBO(31, 66, 146, 1.0),
                                      offset: Offset(1.0, 1.0),
                                    )
                                  ]),
                            ),
                            // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                            trailing: Container(
                              child: Icon(Icons.keyboard_arrow_right,
                                  color: Colors.white, size: 50.0),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                      dboardEntry: snapshot.data[index]),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                  ),
                ),
              ]);
            }
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
        appBar: topAppBar,
        body: makeBody);
  }
}
