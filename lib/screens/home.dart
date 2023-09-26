import 'package:flutter/material.dart';
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
    return ListView(
        children: [
          FutureVideoCard(videoId: "WlFWxhmcxNQ"),
          FutureVideoCard(videoId:"ffnIL6hE__w"),
          FutureVideoCard(videoId: "5Irm9R615Zk"),
          FutureVideoCard(videoId: "z9XWN7u8mSU"),
        ],
    );
  }
}
