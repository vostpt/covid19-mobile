import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({Key key}) : super(key: key);

  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  YoutubePlayerController _controller;
  String _url;

  @override
  Widget build(BuildContext context) {
    _url = ModalRoute.of(context).settings.arguments;
    _controller = YoutubePlayerController(
      initialVideoId: _url,
      flags: YoutubePlayerFlags(
        autoPlay: true,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
        leading: Container(),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
          onReady: () {
            _controller.addListener(() {});
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
