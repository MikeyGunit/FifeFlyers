import 'package:flutter/material.dart';

import 'Dashboard.dart';
import 'Shop.dart';
import 'VideoPageFiles/home_screen.dart';

import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.asset('assets/video/KeeperSave_portrait.mp4')
          ..initialize().then((_) {
            _controller.setVolume(0.0);
            _controller.setLooping(true);
            _controller.play();
            // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
            setState(() {});
          });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: VideoPlayer(_controller),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class FiftyFifty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Top Application bar containing Text header and Secondary options box.
    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Color.fromRGBO(31, 66, 146, 1.0),
      title: Text("Fife Flyers Fifty-Fifty"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.list),
          onPressed: () {},
        )
      ],
    );

    // Main content.
    final makeBody = Stack(children: <Widget>[
      VideoWidget(),
      Container(
        child: Align(
          alignment: Alignment(-0.7, -0.3),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "50/50",
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 50,
                  fontFamily: 'CaptainAmerican',
                    shadows: [
                      Shadow(
                        blurRadius: 2.0,
                        color: Color.fromRGBO(31, 66, 146, 1.0),
                        offset: Offset(3.0, 3.0),
                      )
                    ]
                ),
              ),
              Text(
                "COMING SOON",
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 50,
                  fontFamily: 'CaptainAmerican',
                    shadows: [
                      Shadow(
                        blurRadius: 2.0,
                        color: Colors.blue,
                        offset: Offset(1.0, 1.0),
                      )
                    ]
                ),
              )
            ],
          ),
        ),
      )
    ]);

    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
      appBar: topAppBar,
      body: makeBody
    );
  }
}
