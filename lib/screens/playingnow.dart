import 'package:flutter/material.dart';
import 'package:off_the_hook/variables.dart';
import 'package:off_the_hook/widgets/videoplaying.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:off_the_hook/widgets/videocontrolsbar.dart';

Future<ChewieController> getVideoController(String vidURL) async {
  final videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(vidURL));  
  await videoPlayerController.initialize();

  final chewieController = ChewieController(
    materialProgressColors: ChewieProgressColors(backgroundColor: Colors.transparent, playedColor: Colors.blue),
    cupertinoProgressColors: ChewieProgressColors(backgroundColor: Colors.transparent, playedColor: Colors.blue),
    videoPlayerController: videoPlayerController,
    autoPlay: false,
    looping: false,
    showControlsOnInitialize: false,
    allowMuting: false,
    showOptions: false,
  );
  return chewieController;
}

class PlayingNow extends StatelessWidget {
  const PlayingNow({
    super.key,
    required this.videoURL,
    required this.videoTitle,
    required this.videoDescription,
    required this.channelName,
    required this.views
    });
  final String videoURL;
  final String videoTitle;
  final String videoDescription;
  final String channelName;
  final int views;
  @override
  Widget build(BuildContext context) {
    Future<ChewieController> videoController;
    try{
      videoController = getVideoController(videoURL);
    }
    catch(e){
      return Text("Error loading video2", style: generalTextStyle(bigTitleSize, FontWeight.w700, 1));
    }
   return Padding(
     padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.03),
     child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoPlaying(controller: videoController),
            const SizedBox(height: 10),
            Text(videoTitle, style: generalTextStyle(bigTitleSize, FontWeight.w700, 1)),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(channelName, style: generalTextStyle(16, FontWeight.w500, 1)),
                Text("$views views", style: generalTextStyle(16, FontWeight.w500, 1)),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(child: SingleChildScrollView(scrollDirection: Axis.vertical, child: Text(videoDescription, style: generalTextStyle(18, FontWeight.w600, 1),))),
            VideoControlsBar(controller: videoController),
          ]),
   );
  }
}