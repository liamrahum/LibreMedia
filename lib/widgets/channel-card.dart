//TODO: Create channel class, channel card, dummy channel card

// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:off_the_hook/classes/channel.dart';
import 'package:off_the_hook/screens/screens.dart';
import 'package:off_the_hook/variables.dart';

class ChannelCard extends StatelessWidget {
  const ChannelCard(
      {super.key,
      required this.name,
      required this.id,
      required this.pfp,
      required this.description,
      required this.isFamilyFriendly,
      required this.isAutoGenerated,
      this.subCount = 0,
      this.latestVideosIDs = const []});

  final String name;
  final String id;
  final String pfp;
  final String description;

  final int subCount;

  final bool isFamilyFriendly;
  final bool isAutoGenerated; // Need to ignore channels like this.

  final List<String> latestVideosIDs;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(25),
        child: GestureDetector(
          onTap: () async => await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Scaffold(
                    appBar: AppBar(shadowColor: Colors.transparent),
                    backgroundColor: bgColor,
                    body: ChannelProfile(
                        description: description,
                        id: id,
                        isAutoGenerated: isAutoGenerated,
                        isFamilyFriendly: isFamilyFriendly,
                        name: name,
                        pfp: pfp,
                        latestVideosIDs: latestVideosIDs,
                        subCount: subCount),
                  ))),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6000),
                child: SizedBox(
                    width: 60,
                    height: 60,
                    child: Image.network(pfp, fit: BoxFit.cover)),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: generalTextStyle(
                          videoTitleSize - 2, FontWeight.w700, 1),
                    ),
                    Text(
                      description,
                      overflow: TextOverflow.ellipsis,
                      style:
                          generalTextStyle(smallTextSize, FontWeight.w500, .8),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class DummyChannelCard extends StatelessWidget {
  const DummyChannelCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(25),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6000),
              child: const SizedBox(
                  width: 60,
                  height: 60,
                  child: ColoredBox(color: Colors.white60)),
            ),
            const SizedBox(width: 20),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: 95,
                    height: 12,
                    child: ColoredBox(color: Colors.white60)),
                SizedBox(height: 10),
                SizedBox(
                    width: 120,
                    height: 8,
                    child: ColoredBox(color: Colors.white60)),
              ],
            ),
          ],
        ));
  }
}

class FutureChannelCard extends StatelessWidget {
  const FutureChannelCard({super.key, required this.channelID});
  final String channelID;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Channel>(
      future: fetchChannel(channelID),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data!;
          return ChannelCard(
            name: data.name,
            description: data.description,
            id: data.id,
            isFamilyFriendly: data.isFamilyFriendly,
            isAutoGenerated: data.isAutoGenerated,
            pfp: data.pfp,
            latestVideosIDs: data.latestVideosIDs,
            subCount: data.subCount,
          );
        } else if (snapshot.hasError) return Text('${snapshot.error}');
        return const DummyChannelCard();
      },
    );
  }
}

//TODO: Add a "subscribe" button to card.