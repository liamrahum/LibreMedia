import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:off_the_hook/variables.dart';


int resolutionIndex = 0; //Max Resolution
class Video
{
  final String videoLink;
  final String title;
  final String id;
  final String thumbnailURL;
  final int viewCount;
  final Bool isLive;
  final Bool isUpcoming;

  const Video({
    required this.videoLink,
    required this.title,
    required this.id,
    required this.thumbnailURL,
    required this.viewCount,
    required this.isLive,
    required this.isUpcoming
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    var videoLinks = json['formatStreams'];
    return Video(
      videoLink: videoLinks.last['url'],
      title: json['title'],
      id: json['videoId'],
      thumbnailURL: json['videoThumbnails'][resolutionIndex]['url'],
      viewCount: json['viewCount'],
      isLive: json['liveNow'],
      isUpcoming: json['isUpcoming']
    );
  }
  
}

Future<String> fetchVideo() async {
  final response = await http.get(Uri.parse('${invidiousAPI}videos/aqz-KE-bpKQ'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return response.body;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

