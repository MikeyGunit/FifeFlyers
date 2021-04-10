import 'DboardEntry.dart';
import 'VideoPageFiles//home_screen.dart';
import 'package:flutter/material.dart';
import 'DetailPage.dart';
import 'Shop.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'FiftyFifty.dart';

// import 'package:flutter_app/Shop.dart';

class Dashboard extends StatelessWidget {
// Creating String Var to Hold sent username.
  // This is commented out if we dont need it below.
  // final String username;

// Receiving Username using Constructor. Commented out because I'm out of my bloody depth.
  // Dashboard({Key key, @required this.username}) : super(key: key);

// User Logout Function.
  logout(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
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
    var appData = await http
        .get(
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
          heroImage: u["heroImage"]);

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
    title: Text("Fife Flyers Dashboard"),
    //actions:
  );


  get makeBody1 =>
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
                    height: 200,
                    child: ListView.builder(

                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://www.fifeflyers.co.uk/NewWebsite/App/Images/News/App/Hero/" +
                                        snapshot.data[index].heroImage),
                                fit: BoxFit.fill,
                              ),
                            ),
                            //height: 50,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            //child:
                          child: ListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailPage2(
                                          dboardAppEntry: snapshot.data[index]),
                                ),
                              );
                            },

                          ),
                          );
                        }),
                  ),
                );
              }
            }),);

  // Middle section (page content)
  get makeBody =>
      Container(
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
                        elevation: 8.0,
                        margin: new EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 6.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(31, 66, 146, 1.0),
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://www.fifeflyers.co.uk/NewWebsite/App/Images/News/Hero/" +
                                      snapshot.data[index].heroImage),
                              alignment: Alignment.topRight,
                              fit: BoxFit.cover,
                              colorFilter: new ColorFilter.mode(
                                  Colors.black.withOpacity(0.5),
                                  BlendMode.dstATop),
                            ),
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            leading: Container(
                              padding: EdgeInsets.only(right: 12.0),
                              decoration: new BoxDecoration(
                                  border: new Border(
                                      right: new BorderSide(
                                          width: 1.0, color: Colors.white24))),
                              child: Column(
                                children: [
                                  // Display the correct icon for the media type.
                                  Icon(Icons.article, color: Colors.white),

                                  // Display the media type text.
                                  Text(
                                    snapshot.data[index].mediaType,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            title: Text(
                              snapshot.data[index].title,
                              style: TextStyle(
                                  color: Color.fromRGBO(250, 208, 26, 1.0),
                                  fontSize: 25,
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

                            subtitle: Row(
                              children: <Widget>[
                                Text(
                                  snapshot.data[index].date,
                                  style: TextStyle(
                                      color: Colors.white,
                                      //fontStyle: FontStyle.italic,
                                      fontSize: 11),
                                ),
                              ],
                            ),
                            trailing: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white, size: 30.0),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailPage(
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

  // Bottom Navigation bar
  get makeBottom =>
      Container(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
      appBar: topAppBar,
      body: makeBody,
      bottomNavigationBar: makeBottom,
    );
  }
}

/*
  Old code, kept around so we can get the username variable and the logout button.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('Profile Screen'),
                automaticallyImplyLeading: false),
            body: Center(
                child: Column(children: <Widget>[

                  Container(
                      width: 280,
                      padding: EdgeInsets.all(10.0),
                      child: Text('Username = ' + '\n' + username,
                          style: TextStyle(fontSize: 20))
                  ),

                  RaisedButton(
                    onPressed: () {
                      logout(context);
                    },
                    color: Colors.red,
                    textColor: Colors.white,
                    child: Text('Click Here To Logout'),
                  ),

                ],)
            )
        )
    );
  }
   */
