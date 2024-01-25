import 'package:flutter/material.dart';
import 'package:LibreMedia/widgets/channel-card.dart';
import 'package:LibreMedia/widgets/search-bar.dart';

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
    return Column(
      children: [
        const CustomSearchBar(),
        Expanded(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: const [
              FutureChannelCard(channelID: "UCg6gPGh8HU2U01vaFCAsvmQ"),
              FutureChannelCard(channelID: "UC5qDet6sa6rODi7t6wfpg8g"),
              FutureChannelCard(channelID: "UCux-_Fze30tFuI_5CArwSmg"),
            ],
          ),
        ),
      ],
    );
  }
}
