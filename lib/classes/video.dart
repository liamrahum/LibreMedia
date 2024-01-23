import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:off_the_hook/settingsmanager.dart';
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
  final String publishedText;
  const Video({
    required this.videoURL,
    required this.title,
    required this.channelName,
    required this.id,
    required this.thumbnailURL,
    required this.viewCount,
    required this.videoDescription,
    required this.publishedText
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
      videoDescription: json['description'],
      publishedText: json['publishedText']
    );
  }
}

Future<Video> fetchVideoData(String videoId) async {
  final response = await http.get(Uri.parse('${await SettingsManager().getInstanceAPI()}videos/$videoId'));
  var responseBody = utf8.decode(response.bodyBytes);
  if (response.statusCode != 200) {
    throw Exception('Failed to load video');
  }
  return Video.fromJson(jsonDecode(responseBody));
}

Future<List<String>> fetchVideoList(String query)  async {
  List<String> videos = [];
  if(query=="")return videos;
  
  final response = await http.get(Uri.parse('${await SettingsManager().getInstanceAPI()}search?q=$query&type=video'));
  var responseBody = utf8.decode(response.bodyBytes);
  if (response.statusCode != 200) {
    throw Exception('Failed to load videos');
  }
  
  int i = 0;
  List jsonBody = jsonDecode(responseBody);
  
  for(i = 0; i < (jsonBody.length < 5 ? jsonBody.length : 5);i++)
  {
    videos.add(jsonBody[i]["videoId"]);
  }
  return videos;
}

Future<List<String>> fetchChannelVideos(String channelId) async
{
  List<String> videos = [];
  if(channelId=="")return videos;
  
  final response = await http.get(Uri.parse('${await SettingsManager().getInstanceAPI()}channels/$channelId/videos'));      
  var responseBody = utf8.decode(response.bodyBytes);
  if (response.statusCode != 200) {
    throw Exception('Failed to load channel');
  }
  
  int i = 0;
  List jsonBody = jsonDecode(responseBody);
  
  for(i = 0; i < (jsonBody.length < 5 ? jsonBody.length : 5);i++)
  {
//    videos.add(jsonBody.videos[i]);
  }
  return videos;
}

//TODO: fetchChannelVideos - gets channel name and returns list of video IDs
//TODO: randomize search results
