// ignore_for_file: prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:off_the_hook/classes/video.dart';
import 'package:off_the_hook/variables.dart';
import 'package:off_the_hook/widgets/videocard.dart';

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
    
    return ListView(
        children: [

          TextField(onSubmitted: (prompt) async {
            List<String> list = await fetchVideoList(prompt);
            Navigator.push(context, MaterialPageRoute(builder: (context) => 
            Scaffold(
              backgroundColor: bgColor,
            appBar: AppBar(shadowColor: Colors.transparent, title: const Text("Search results")),

            body: ListView.builder(
              addAutomaticKeepAlives: true,
              itemCount: list.length, itemBuilder: (context, index) {
                return FutureVideoCard(videoId: list[index]);
            }),

          )));
          }),
          FutureVideoCard(videoId: "J86eDJMKCKI"),

        ],
    );
  }
}
