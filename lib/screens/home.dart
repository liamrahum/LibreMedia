import 'package:flutter/material.dart';
import 'package:off_the_hook/classes/video.dart';
import 'package:off_the_hook/widgets/widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          FutureBuilder<Video>(future: fetchVideo("ffnIL6hE__w"),builder: (context, snapshot) {
            if(snapshot.hasData){
              var data = snapshot.data!;
              return VideoCard(thumbnailURL: data.thumbnailURL, videoTitle: data.title, channelName: "aa", views: data.viewCount);
            }
            else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            else {
              return const Text("Banana");
            }
            
  },),
  FutureBuilder<Video>(future: fetchVideo("WlFWxhmcxNQ"),builder: (context, snapshot) {
            if(snapshot.hasData){
              var data = snapshot.data!;
              return VideoCard(thumbnailURL: data.thumbnailURL, videoTitle: data.title, channelName: "aa", views: data.viewCount);
            }
            else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            else {
              return const Text("Banana");
            }
  })
  ],
      )
    );
  }
}