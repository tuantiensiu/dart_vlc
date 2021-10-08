import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter/material.dart';

class PlayVideoScreen extends StatefulWidget {
  PlayVideoScreen({Key? key}) : super(key: key);

  @override
  _PlayVideoScreenState createState() => _PlayVideoScreenState();
}

class _PlayVideoScreenState extends State<PlayVideoScreen> {
  Player player = new Player(id: 69420);
  String fullPath =
      'https://cdn.vgm.tv/encrypted/testnonencrypted/playlist.m3u8';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    player.open(Media.network(fullPath));

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Test dart vlc'),
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

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    player.dispose();
  }
}
