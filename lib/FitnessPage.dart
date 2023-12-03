import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FitnessPage extends StatelessWidget {
  const FitnessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define some YouTube video IDs
    final List<String> videoIds = [
      'video_id_1', // Replace with actual YouTube video IDs
      'video_id_2',
      // Add more video IDs as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fitness Page'),
      ),
      body: ListView(
        children: <Widget>[
          ...videoIds.map(
            (videoId) => YoutubeVideoCard(videoId: videoId),
          ),
          // Add more options as needed
        ],
      ),
    );
  }
}

class YoutubeVideoCard extends StatelessWidget {
  final String videoId;

  const YoutubeVideoCard({Key? key, required this.videoId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );

    return Card(
      child: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        onReady: () {
          _controller.addListener(() {});
        },
      ),
    );
  }
}
