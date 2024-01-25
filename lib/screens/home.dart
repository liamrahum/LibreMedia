import 'package:LibreMedia/classes/subscriptions.dart';
import 'package:LibreMedia/widgets/video-card.dart';
import 'package:flutter/material.dart';
import 'package:LibreMedia/widgets/channel-card.dart';
import 'package:LibreMedia/widgets/search-bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future subscriptions = Subscriptions().getSubscriptions();
  @override
  void initState() {
    subscriptions = Subscriptions().getSubscriptions();
    super.initState();
  }
  _refreshPage()
  {
    setState(() {
      subscriptions = Subscriptions().getSubscriptions();    
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomSearchBar(),
        FutureBuilder(
          future: subscriptions,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const DummyChannelCard();
            List<String> channels = snapshot.data!.toList();
            return Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) =>
                    FutureChannelCard(channelID: channels[index]),
              ),
            );
          },
        ),
        ElevatedButton(onPressed: _refreshPage, child: const Text("Refresh"))
      ],
    );
  }
}
