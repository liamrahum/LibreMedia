// ignore_for_file: prefer_const_literals_to_create_immutables, use_build_context_synchronously, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:LibreMedia/classes/video.dart';
import 'package:LibreMedia/variables.dart';
import 'package:LibreMedia/widgets/channel-card.dart';
import 'package:LibreMedia/widgets/video-card.dart';

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
        const SearchBar(),
        Expanded(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const FutureChannelCard(channelID: "UCg6gPGh8HU2U01vaFCAsvmQ"),
              const FutureChannelCard(channelID: "UC5qDet6sa6rODi7t6wfpg8g"),
              const FutureChannelCard(channelID: "UCux-_Fze30tFuI_5CArwSmg"),
              
            ],
          ),
        ),
      ],
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .04),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search',
          filled: true,
          fillColor: const Color(0xFF363636),
          contentPadding: const EdgeInsets.only(
            left: 14.0,
            bottom: 6.0,
            top: 8.0,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF363636)),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onSubmitted: (prompt) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Scaffold(
                backgroundColor: bgColor,
                appBar: AppBar(
                  shadowColor: Colors.transparent,
                  title: const Text("Search results"),
                ),
                body: SearchResultVideoCards(prompt: prompt),
              ),
            ),
          );
        },
      ),
    );
  }
}

class SearchResultVideoCards extends StatelessWidget {
  const SearchResultVideoCards({super.key, required this.prompt});
  final String prompt;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchVideoList(prompt),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            addAutomaticKeepAlives: true,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return FutureVideoCard(videoId: snapshot.data![index]);
            },
          );
        } else if (snapshot.hasError)
          return const Text("Error loading videos");
        else
          return const LinearProgressIndicator();
      },
    );
  }
}
