// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:off_the_hook/classes/video.dart';
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
          TextField(onSubmitted: (prompt) => Navigator.push(context, MaterialPageRoute(builder: (context) => Scaffold(
            body: ListView.builder(itemCount: 5, itemBuilder: (context, index) {
                return FutureVideoCard(videoId: "J86eDJMKCKI");
            }),
          ))))
        ],
    );
  }
}
