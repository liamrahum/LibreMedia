// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:off_the_hook/variables.dart';
import 'package:off_the_hook/classes/video.dart';
class VideoCard extends StatelessWidget {
  const VideoCard({
    super.key,
    required this.thumbnailURL,
    required this.videoTitle,
    required this.channelName,
    required this.views,
  });

  final String thumbnailURL;
  final String videoTitle;
  final String channelName;
  final int views;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(thumbnailURL, fit: BoxFit.fitWidth),
          ),
          Text(
            videoTitle,
            style: generalTextStyle(videoTitleSize, FontWeight.w700, 1),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                channelName,
                style: generalTextStyle(smallTextSize, FontWeight.w600, 0.6),
              ),
              Text(
                "$views views",
                style: generalTextStyle(smallTextSize, FontWeight.w600, 0.6),
              ),
            ],
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}



class FutureVideoCard extends StatelessWidget {
  const FutureVideoCard({super.key,required this.videoId});
  final String videoId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Video>(
      future: fetchVideoData(videoId),
      builder: (context, snapshot) {
        if (snapshot.hasData)
        {
          var data = snapshot.data!;
          return VideoCard(
            thumbnailURL: data.thumbnailURL,
            videoTitle: data.title,
            channelName: data.channelName,
            views: data.viewCount,
          );
        } 
        else if (snapshot.hasError) 
        {
          return Text('${snapshot.error}');
        } 
        else
        {
          return const Text("");
        }
      },
    );
  }
}
