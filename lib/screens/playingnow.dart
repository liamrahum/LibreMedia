import 'package:flutter/material.dart';
import 'package:off_the_hook/widgets/videoplaying.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:off_the_hook/widgets/videocontrolsbar.dart';
class PlayingNow extends StatefulWidget {
  const PlayingNow({super.key});
  @override
  State<PlayingNow> createState() => _PlayingNowState();
}

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
    showOptions: false
  );
  return chewieController;
}

class _PlayingNowState extends State<PlayingNow> {
  Future<ChewieController> vidController = getVideoController('https://rr2---sn-5oxmp55u-8pxe.googlevideo.com/videoplayback?expire=1695758047&ei=f-ISZY6FLMKs6dsP3uSf6Ak&ip=202.61.230.52&id=o-ANI_4cPgPzxeCyYGwKV7Wd_LaMg8QwQoXmPzrbXhwmye&itag=22&source=youtube&requiressl=yes&mh=aP&mm=31%2C29&mn=sn-5oxmp55u-8pxe%2Csn-4g5edn6r&ms=au%2Crdu&mv=m&mvi=2&pl=23&initcwndbps=997500&spc=UWF9fy3NSowlY9CHZEFdASOquT4m0xc&vprv=1&svpuc=1&mime=video%2Fmp4&cnr=14&ratebypass=yes&dur=634.624&lmt=1662343734047004&mt=1695735955&fvip=5&fexp=24007246&beids=24350017&c=ANDROID&txp=5532434&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cspc%2Cvprv%2Csvpuc%2Cmime%2Ccnr%2Cratebypass%2Cdur%2Clmt&sig=AOq0QJ8wRQIgZh7-K1WbY7uXZH0M-Dr_KOYlHru0Zjl3SCl9hXakIgUCIQCobwj0vO3d_bz6NMFlpORFK_938GswsETsX4e33g5fXw%3D%3D&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AG3C_xAwRAIgQMaE4R9A_iWB1rXWoIWprfpxWoIxzUMAhilDG39NxGkCIDi7vtQxrnyyeEKByVWagkZ4j4W14MedvQklt9z6PW12&host=rr2---sn-5oxmp55u-8pxe.googlevideo.com');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VideoPlaying(controller: vidController),
        VideoControlsBar(controller: vidController),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
