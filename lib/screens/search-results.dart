import 'package:LibreMedia/classes/fetch-data.dart';
import 'package:LibreMedia/widgets/video-card.dart';
import 'package:flutter/material.dart';

class SearchResultVideoCards extends StatelessWidget {
  const SearchResultVideoCards({super.key, required this.prompt});
  final String prompt;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchSearchQuery(prompt),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            addAutomaticKeepAlives: true,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return FutureVideoCard(videoId: snapshot.data![index]);
            },
          );
        }
        return snapshot.hasError
            ? const Text("Error loading videos")
            : const LinearProgressIndicator();
      },
    );
  }
}
