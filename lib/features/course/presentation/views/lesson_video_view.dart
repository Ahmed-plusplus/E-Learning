import 'package:elearning/features/course/data/model/lesson_model.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class LessonVideoView extends StatefulWidget {
  const LessonVideoView({super.key, required this.lesson});

  final LessonModel lesson;

  @override
  State<LessonVideoView> createState() => _LessonVideoViewState();
}

class _LessonVideoViewState extends State<LessonVideoView> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();

    if(widget.lesson.videoUrl != null) {
      _controller = VideoPlayerController.networkUrl(
        Uri.parse(widget.lesson.videoUrl!),
      )..initialize().then((_) {
        if (mounted) {
          setState(() {});
        }
      });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Builder(
          builder: (context) {
            if (!(_controller?.value.isInitialized ?? false)) {
              return CircularProgressIndicator();
            }
            return AspectRatio(
              aspectRatio: _controller!.value.aspectRatio,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  VideoPlayer(_controller!),

                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (_controller!.value.isPlaying) {
                          _controller!.pause();
                        } else {
                          _controller!.play();
                        }
                      });
                    },
                    icon: Icon(
                      _controller!.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
