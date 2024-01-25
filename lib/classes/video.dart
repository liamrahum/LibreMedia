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
