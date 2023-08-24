import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<StatefulWidget> createState() => _VideoScreen();
}

class _VideoScreen extends State<VideoScreen> {
  var logger = Logger();

  List<String> urls = [
    'assets/videos/ad_video1.mp4',
    'assets/videos/ad_video2.mp4',
  ];
  int currentIndex = 0;
  late VideoPlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.asset(urls[currentIndex])
      ..addListener(checkVideo)
      ..initialize().then((_) {
        setState(() {});
      })
      ..play();
  }

  void checkVideo() {
    if (!_controller.value.isPlaying &&
        _controller.value.isBuffering == false &&
        _controller.value.duration == _controller.value.position) {
      if (currentIndex < urls.length - 1) {
        currentIndex++;
        _controller.dispose();
        _controller = VideoPlayerController.asset(urls[currentIndex])
          ..initialize().then((_) {
            setState(() {});
          })
          ..play();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    VideoPlayer(_controller),
                    ClosedCaption(text: _controller.value.caption.text),
                    VideoProgressIndicator(_controller, allowScrubbing: false),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
