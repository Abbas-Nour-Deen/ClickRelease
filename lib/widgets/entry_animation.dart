import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class EntryAnimationScreen extends StatelessWidget {
  const EntryAnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          VideoPlayer(
            VideoPlayerController.asset("assets/animations/mp4animation.mp4",
                videoPlayerOptions:
                    VideoPlayerOptions(allowBackgroundPlayback: false)),
          )
        ],
      ),
    );
  }
}
