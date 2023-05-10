// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fitguide_exercise/core/service/api/api_constant.dart';
import 'package:flutter/material.dart';
import 'package:youtube_api/youtube_api.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailedExercise extends StatefulWidget {
  final String name;
  final String type;
  final String muscle;
  final String equipment;
  final String difficulty;
  final String instructions;

  const DetailedExercise(
      {super.key,
      required this.name,
      required this.type,
      required this.muscle,
      required this.equipment,
      required this.difficulty,
      required this.instructions});

  @override
  State<DetailedExercise> createState() => _DetailedExerciseState();
}

class _DetailedExerciseState extends State<DetailedExercise> {
  bool typing = false;

  YoutubeAPI youtube =
      YoutubeAPI(YoutubeApi.apiKey, maxResults: 1, type: 'Video');
  List<YouTubeVideo> videoResult = [];

  Future<void> callAPI() async {
    videoResult = await youtube.search(
      "${widget.name} tutorial",
      order: 'relevance',
      videoDuration: 'any',
    );
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    callAPI();
  }

  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'kvO_nHnvPtQ',
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
      hideThumbnail: true,
      showLiveFullscreenButton: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FadeInImage(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            placeholder: AssetImage("assets/images/placeholder.png"),
            image: AssetImage("assets/images/placeholder.png"),
            imageErrorBuilder: (context, error, stackTrace) {
              return Center(
                child: Icon(Icons.broken_image),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: buildDetails(),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.black.withOpacity(0.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.blue,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () async {},
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDetails() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -3),
            blurRadius: 6,
            color: Colors.black12,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Center(
              child: Container(
                height: 8,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.grey[600],
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 30),
            Text(
              widget.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Difficulty',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              widget.difficulty,
            ),
            SizedBox(height: 8),
            Text(
              'Exercise Type',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              widget.type,
            ),
            SizedBox(height: 20),
            Text(
              'Equipment',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              widget.equipment,
            ),
            SizedBox(height: 20),
            Text(
              'Muscle ',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              widget.muscle,
            ),
            SizedBox(height: 20),
            Text(
              'Instruction',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(widget.instructions),
            SizedBox(height: 30),
            Text(
              'Tutorial Video',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: videoResult.map<Widget>(listItem).toList(),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget listItem(YouTubeVideo video) {
    String id = video.id.toString();
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      bottomActions: [
        CurrentPosition(),
        ProgressBar(isExpanded: true),
      ],
      progressColors: ProgressBarColors(
        playedColor: Colors.amber,
        handleColor: Colors.amberAccent,
      ),
      onReady: () {
        _controller.load(id);
      },
    );
  }
}
