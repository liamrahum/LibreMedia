import 'package:LibreMedia/classes/history.dart';
import 'package:LibreMedia/widgets/video-card.dart';
import 'package:flutter/material.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: WatchHistory().getWatchHistory(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const DummyVideoCard(displayThumbnail: true);
        } else if (snapshot.hasError) {
          return const Text("Error loading history");
        }
        List<Widget> videos =
            snapshot.data!.map((videoID) => FutureVideoCard(videoId: videoID)).toList();

        return ListView.builder(
          itemCount: videos.length,
          itemBuilder: (context, index) => videos[index],
        );
      },
    );
  }
}
