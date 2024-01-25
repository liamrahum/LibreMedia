import 'package:LibreMedia/classes/history.dart';
import 'package:LibreMedia/widgets/video-card.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  var historyData = WatchHistory().getWatchHistory();
  void _refreshPage() {
    setState(() {
      historyData = WatchHistory().getWatchHistory();
    });
  }
void _clearHistory() {
    setState(() {
      WatchHistory().clearWatchHistory();
      _refreshPage();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
            future: historyData,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const DummyVideoCard(displayThumbnail: true);
              } else if (snapshot.hasError) {
                return const Text("Error loading history");
              }
              List<Widget> videos = snapshot.data!
                  .map((videoID) => FutureVideoCard(videoId: videoID))
                  .toList();
        
              return Expanded(
                child: ListView.builder(
                  itemCount: videos.length,
                  itemBuilder: (context, index) => videos[index],
                ),
              );
            }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: _refreshPage, child: const Text("Refresh")),
              ElevatedButton(onPressed: _clearHistory, child: const Text("Clear history")),
            ],
          ),
      ],
    );
  }
}
