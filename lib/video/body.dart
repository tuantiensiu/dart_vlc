import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Player player = new Player(id: 69420, commandlineArguments: ['--no-video']);

  @override
  void initState() {
    String fullPath = 'assets/video/video.mp4';

    player.open(Media.asset(fullPath));

    super.initState();
  }
  // @override
  // void didChangeDependencies() async {
  //   //  String cleanPathVideo = NameVideoMap[widget.pathVideo];
  //   // String fullPath = 'assets/videos/${cleanPathVideo}.mp4';
  //   String fullPath = 'assets/video/video.mp4';

  //   player.open(Media.asset(fullPath));
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('test dart vlc'),
          centerTitle: true,
        ),
        body: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(4.0),
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 2.0,
                  child: Video(
                    player: player,
                    width: 640,
                    height: 480,
                    volumeThumbColor: Colors.blue,
                    volumeActiveColor: Colors.blue,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
