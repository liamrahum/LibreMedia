import 'package:flutter/material.dart';
import 'package:off_the_hook/widgets/widgets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          VideoCard(thumbnailURL: "https://i.ytimg.com/vi/erK1spmiubM/hqdefault.jpg", channelName: "Magnus", videoTitle: "Flutter Tutorial - How to Play Youtube Videos (youtube_player_flutter)",views: "36M Views"),
          VideoCard(thumbnailURL: "https://i.ytimg.com/vi/zR6vzJPlKrg/hqdefault.jpg", channelName: "Linus Tech Tips", videoTitle: "We Tried 5G Blocking Paint…",views: "820K Views"),
        ],
      )
    );
  }
}