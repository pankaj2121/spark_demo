import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final String videoPath; // Local or network video path
  final bool isCircular;
  final bool? isPlaying;

  const CustomVideoPlayer(
      {super.key,
      required this.videoPath,
      required this.isCircular,
      this.isPlaying});

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    // _isPlaying = widget.isPlaying!;
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {}); // Refresh UI when video is ready
        _controller.setLooping(true); // Loop video
        widget.isPlaying == false
            ? null
            : _controller.play(); // Auto-play video
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget videoWidget = SizedBox(
      width: 220.w, // Adjust size as needed
      height: 220.h,
      child: _controller.value.isInitialized
          ? VideoPlayer(_controller)
          : const Center(
              child: CircularProgressIndicator()), // Loading indicator
    );
    return widget.isCircular
        ? ClipOval(
            child: videoWidget,
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: videoWidget,
          );
  }
}
