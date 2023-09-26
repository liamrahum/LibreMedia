import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class VideoControlsBar extends StatefulWidget {
  const VideoControlsBar({
    super.key,
    required this.controller
  });
  final Future<ChewieController> controller;

  @override
  State<VideoControlsBar> createState() => _VideoControlsBarState();
}

class _VideoControlsBarState extends State<VideoControlsBar> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.controller,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Text("");
        }
        var controller = snapshot.data!;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () => setState(() {
                      controller.togglePause();
                    }),
                    icon: SvgPicture.asset(
                      controller.isPlaying ? "lib/assets/icons/pause.svg" : "lib/assets/icons/play.svg",
                      height: 50
                    ),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  IconButton(
                    onPressed: () => setState(() {
                      controller.enterFullScreen();
                    }),
                    icon: SvgPicture.asset(
                      "lib/assets/icons/maximize.svg",
                      height: 50,
                    ),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  IconButton(
                    onPressed: () => setState(() {
                      controller.seekTo(controller.videoPlayerController.value.position - const Duration(seconds: 10));
                    }),
                    icon: SvgPicture.asset(
                      "lib/assets/icons/arrow-left.svg",
                      height: 50,
                    ),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  IconButton(
                    onPressed: () => setState(() {
                      controller.seekTo(controller.videoPlayerController.value.position + const Duration(seconds: 10));
                    }),
                    icon: SvgPicture.asset(
                      "lib/assets/icons/arrow-right.svg",
                      height: 50,
                    ),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
