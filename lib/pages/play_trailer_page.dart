import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayTrailerPage extends StatefulWidget {
  final String videoUrl;

  PlayTrailerPage(this.videoUrl);

  @override
  State<PlayTrailerPage> createState() => _PlayTrailerPageState();
}

class _PlayTrailerPageState extends State<PlayTrailerPage> {
  late ChewieController _chewieController;
  late VideoPlayerController _videoPlayerController;
  late Future<void> _future;

  Future<void> initVideoPlayer() async {
    await _videoPlayerController.initialize();
    setState(() {
      print(_videoPlayerController.value.aspectRatio);
      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        aspectRatio: _videoPlayerController.value.aspectRatio,
        autoPlay: true,
        looping: false,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    // _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    // _chewieController = ChewieController(
    //   videoPlayerController: _videoPlayerController,
    //   autoPlay: true,
    //   autoInitialize: true,
    //   looping: false,
    //   aspectRatio: null,
    // );
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _future = initVideoPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          child: FutureBuilder(
            future: _future,
            builder: (context, snapshot) {
              return Center(
                child: _videoPlayerController.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _videoPlayerController.value.aspectRatio,
                        child: Chewie(
                          controller: _chewieController,
                        ),
                      )
                    : null,
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}
