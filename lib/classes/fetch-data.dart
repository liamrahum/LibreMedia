import 'dart:async';
import 'dart:convert';
import 'package:LibreMedia/classes/video.dart';
import 'channel.dart';
import 'package:LibreMedia/classes/settings-manager.dart';
import 'package:http/http.dart' as http;

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

Future<List<String>> fetchSearchQuery(String query) async 
{
  List<String> result = [];
  if(query=="")return result;
  
  final response = await http.get(Uri.parse('${await SettingsManager().getInstanceAPI()}search?q=$query&type=channel'));
  var responseBody = utf8.decode(response.bodyBytes);
  if (response.statusCode != 200) {
    throw Exception('Failed to load videos');
  }
  
  int i = 0;
  List jsonBody = jsonDecode(responseBody);
  
  for(i = 0; i < (jsonBody.length < 2 ? jsonBody.length : 2);i++)
  {
    result.add(jsonBody[i]["authorId"]);
  }
  result += await fetchVideoList(query);
  return result;
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

Future<Channel> fetchChannel(String videoId) async {
  final response =
      await http.get(Uri.parse('${await SettingsManager().getInstanceAPI()}channels/$videoId'));
  var responseBody = utf8.decode(response.bodyBytes);
  if (response.statusCode != 200) {
    throw Exception('Failed to load video');
  }
  return Channel.fromJson(jsonDecode(responseBody));
}

//TODO: fetchChannelVideos - gets channel name and returns list of video IDs
//TODO: randomize search results