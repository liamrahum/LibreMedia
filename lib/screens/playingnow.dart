
import 'package:flutter/material.dart';
import 'package:off_the_hook/variables.dart';
import 'package:off_the_hook/widgets/videoplaying.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:off_the_hook/widgets/videocontrolsbar.dart';

Future<ChewieController> getVideoController(String vidURL) async {
  final videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(vidURL));
  try {await videoPlayerController.initialize();}catch(e){}
  final chewieController = ChewieController(
    materialProgressColors: ChewieProgressColors(backgroundColor: Colors.transparent, playedColor: Colors.blue),
    cupertinoProgressColors: ChewieProgressColors(backgroundColor: Colors.transparent, playedColor: Colors.blue),
    videoPlayerController: videoPlayerController,
    autoPlay: false,
    looping: false,
    showControlsOnInitialize: false,
    allowMuting: false,
    showOptions: false
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

    
   return Column(
      children: [
        VideoPlaying(controller: videoController),
          BackButton(onPressed:()=> Navigator.of(context).pop()),
        Text(videoTitle, style: generalTextStyle(bigTitleSize, FontWeight.w700, 1), textAlign: TextAlign.start,),
        Text(channelName, style: generalTextStyle(16, FontWeight.w500, 1)),
        
        Expanded(child: SingleChildScrollView(scrollDirection: Axis.vertical, child: Text(videoDescription, style: generalTextStyle(18, FontWeight.w600, 1),))),
        Text("You're one of $views viewers", style: generalTextStyle(16, FontWeight.w500, 1)),
        
        VideoControlsBar(controller: videoController),
      ]
   );
  }
}