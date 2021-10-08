import 'dart:typed_data';
import "package:hex/hex.dart";
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/variable/containt.dart';
import 'package:test_flutter/video/play_video_screen.dart';
import 'dart:io';
import 'dart:async';
import 'package:flutter_hls_parser/flutter_hls_parser.dart';
import 'package:http/http.dart' as http;
import 'package:dart_vlc/dart_vlc.dart';

void main() async {
  DartVLC.initialize();
  runApp(PlayVideoScreen());

  var url = Uri.parse(
      'https://vgmvb.global.ssl.fastly.net/video/video_demo/1080p.m3u8');
  var response = await http.get(url);
  print(response.body);

  const PLAYLIST_URL =
      'https://vgmvb.global.ssl.fastly.net/video/video_demo/1080p.m3u8';

  Future<HlsMediaPlaylist> _parseMediaPlaylist(
      List<String> extraLines, String uri) async {
    var playlistUri = Uri.parse(uri);
    var parser = HlsPlaylistParser.create();
    var playList = await parser.parse(playlistUri, extraLines);
    return playList as HlsMediaPlaylist;
  }

  var playlist =
      await _parseMediaPlaylist(response.body.split('\n'), PLAYLIST_URL);
  String fileKey = playlist.segments[0].encryptionIV.toString();
  String finalKey = 'VGM-' + fileKey.substring(2, 6);
  print(finalKey);
  print(playlist.segments[0].encryptionIV.toString());
  print(fileKey.substring(2, 6));

  Uint8List xor(Uint8List a, Uint8List b) {
    if (a.lengthInBytes == 0 || b.lengthInBytes == 0) {
      throw ArgumentError.value(
          "lengthInBytes of Uint8List arguments must be > 0");
    }

    bool aIsBigger = a.lengthInBytes > b.lengthInBytes;
    int length = aIsBigger ? a.lengthInBytes : b.lengthInBytes;

    Uint8List buffer = Uint8List(length);

    for (int i = 0; i < length; i++) {
      var aa, bb;
      try {
        aa = a.elementAt(i);
      } catch (e) {
        aa = 0;
      }
      try {
        bb = b.elementAt(i);
      } catch (e) {
        bb = 0;
      }

      buffer[i] = aa ^ bb;
    }

    return buffer;
  }

  var resKey = await http.get(Uri.parse(
      'https://vgmvb.global.ssl.fastly.net/video/video_demo/key.vgmk'));
  // StringBuffer body = new StringBuffer('helxlo');

  List<int> list = finalKey.codeUnits;
  List<int> listbody = resKey.bodyBytes;
  Uint8List bytesa = Uint8List.fromList(list);
  Uint8List bytesb = Uint8List.fromList(listbody);
  // String string = String.fromCharCodes(bytesa); // const keytwo =
  // const KEY = playlist.segments[0].encryptionIV
  // print("${(bytesbody xor bytes)}");
  print(bytesa);
  print(bytesb);

  print('xor');
  Uint8List buffer = xor(bytesa, bytesb);

  print(buffer);
  Uint8List buffer2 = xor(buffer, bytesa);
  print(buffer2);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: PlayVideoScreen(),
    );
  }
}

class FlutterDemo extends StatefulWidget {
  const FlutterDemo({Key? key}) : super(key: key);

  @override
  _FlutterDemoState createState() => _FlutterDemoState();
}

class _FlutterDemoState extends State<FlutterDemo> {
  @override
  void initState() {
    super.initState();
  }

  Future<File> get _localFile async {
    print('get file');
    return File(
        'https://vgmvb.global.ssl.fastly.net/video/video_demo/1080p.m3u8');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Reading file'),
        ),
        body: Center(
          child: Text('data'),
        ));
  }
}
