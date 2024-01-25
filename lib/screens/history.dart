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
        }
        List<Widget> videos = snapshot.data!.map((child) => Text(child)).toList();

        return ListView.builder(
          itemCount: videos.length,
          itemBuilder: (context, index) => videos[index],
        );
      },
    );
  }
}
