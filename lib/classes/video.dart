import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:off_the_hook/variables.dart';

int resolutionIndex = 3; // Max Resolution

class Video {
  final String videoURL;
  final String title;
  final String channelName;
  final String id;
  final String thumbnailURL;
  final int viewCount;

  final String videoDescription;

  const Video({
    required this.videoURL,
    required this.title,
    required this.channelName,
    required this.id,
    required this.thumbnailURL,
    required this.viewCount,
    required this.videoDescription
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    var videoLinks = json['formatStreams'];
    return Video(
      videoURL: videoLinks.last['url'],
      title: json['title'],
      channelName: json['author'],
      id: json['videoId'],
      thumbnailURL: json['videoThumbnails'][resolutionIndex]['url'],
      viewCount: json['viewCount'],
      videoDescription: json['description']
    );
  }
}

Future<Video> fetchVideoData(String videoId) async {
  final response = await http.get(Uri.parse('${invidiousAPI}videos/$videoId'));
  var responseBody = utf8.decode(response.bodyBytes);
  if (response.statusCode == 200) {
    return Video.fromJson(jsonDecode(responseBody));
  } else {
    throw Exception('Failed to load album');
  }
}
