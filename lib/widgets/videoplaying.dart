import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';

class VideoPlaying extends StatelessWidget {
  const VideoPlaying({
    super.key,
    required this.controller,
  });
  final Future<ChewieController> controller;

  @override
  Widget build(BuildContext context) {
  double videoHeight = MediaQuery.of(context).size.height * 0.25;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: videoHeight * 16 / 9,
          height: videoHeight,
          child: FutureBuilder(
            future: controller,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Chewie(controller: snapshot.data!);
              } else {
                return const Text("Error loading video");
              }
            },
          ),
        ),
      ],
    );
  }
}