import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:off_the_hook/classes/video.dart';
import 'package:off_the_hook/widgets/widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<String> futureData;
  
  @override
  void initState() {
    super.initState();
    futureData = fetchVideo();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          FutureBuilder<String>(future: futureData, builder:(context, snapshot) => Text(snapshot.hasData ? snapshot.data! : "Eggroll",)),
          VideoCard(thumbnailURL: "https://i.ytimg.com/vi/erK1spmiubM/hqdefault.jpg", channelName: "Magnus", videoTitle: "Flutter Tutorial - How to Play Youtube Videos (youtube_player_flutter)",views: "36M Views"),
          VideoCard(thumbnailURL: "https://i.ytimg.com/vi/zR6vzJPlKrg/hqdefault.jpg", channelName: "Linus Tech Tips", videoTitle: "We Tried 5G Blocking Paint…",views: "820K Views"),
        ],
      )
    );
  }
}