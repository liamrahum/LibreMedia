import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:LibreMedia/variables.dart';

class VideoPlaying extends StatelessWidget {
  const VideoPlaying({
    super.key,
    required this.controller,
  });
  final Future<ChewieController> controller;

  @override
  Widget build(BuildContext context) {
    double videoWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: videoWidth,
          height: videoWidth * 9 / 16,
          child: FutureBuilder(
            future: controller,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Chewie(controller: snapshot.data!);
              } else {
                return const LinearProgressIndicator(
                    color: primaryColor, backgroundColor: bgColor);
              }
            },
          ),
        ),
      ],
    );
  }
}
