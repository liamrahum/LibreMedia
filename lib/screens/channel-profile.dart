import 'package:flutter/material.dart';
import 'package:LibreMedia/widgets/video-card.dart';

//TODO: add pages to see channel history.

class ChannelProfile extends StatelessWidget {
  final String name;
  final String id;
  final String pfp;
  final String description;

  final int subCount;

  final bool isFamilyFriendly;
  final bool isAutoGenerated; // Need to ignore channels like this.

  final List<String> latestVideosIDs;

  const ChannelProfile(
      {super.key,
      required this.name,
      required this.id,
      required this.pfp,
      required this.description,
      required this.isFamilyFriendly,
      required this.isAutoGenerated,
      this.subCount = 0,
      this.latestVideosIDs = const []});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(borderRadius: BorderRadius.circular(600), child: Image.network(pfp)),
        const SizedBox(height: 15),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: latestVideosIDs.length,
            itemBuilder: (context, index) =>
                FutureVideoCard(videoId: latestVideosIDs[index]),
          ),
        ),
      ],
    );
  }
}
