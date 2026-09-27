import 'package:elearning/features/course/data/model/lesson_model.dart';
import 'package:flick_video_player/flick_video_player.dart';
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
  late FlickManager _flickManager;

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
      _flickManager = FlickManager(videoPlayerController: _controller!);

    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    _flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Builder(
          builder: (context) {
            final flickController = _flickManager.flickVideoManager?.videoPlayerController;
            if(flickController?.value.hasError ?? false){
              Text(flickController!.value.errorDescription ?? 'There is something error');
            }
            if (flickController == null || !(flickController.value.isInitialized)) {
              return CircularProgressIndicator();
            }
            return AspectRatio(
              aspectRatio: flickController.value.aspectRatio,
              child: FlickVideoPlayer(
                flickManager: _flickManager,
              ),
            );
          }
        ),
      ),
    );
  }
}
