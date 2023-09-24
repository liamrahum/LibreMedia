// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:off_the_hook/variables.dart';
class VideoCard extends StatelessWidget {
  const VideoCard({super.key, required this.thumbnailURL, required this.videoTitle, required this.channelName, required this.views});
  final String thumbnailURL;
  final String videoTitle;
  final String channelName;
  final String views;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(children: [
        AspectRatio(aspectRatio: 16 / 9, child: Image.network(thumbnailURL, fit: BoxFit.fitWidth)),
        Text(videoTitle, style: generalTextStyle(videoTitleSize, FontWeight.w700)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(channelName, style: generalTextStyle(smallTextSize, FontWeight.w400)),
            Text(views, style: generalTextStyle(smallTextSize, FontWeight.w400)),
          ],
        ),
      ]
      ,crossAxisAlignment: CrossAxisAlignment.start),
    );
  }
}