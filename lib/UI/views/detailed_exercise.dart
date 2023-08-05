import 'package:fitguide_exercise/models/service/favorite_manager.dart';
import 'package:fitguide_exercise/utils/colors/colors.dart';
import 'package:fitguide_exercise/utils/constants/api_constant.dart';
import 'package:fitguide_exercise/utils/preferences/preferences_utils.dart';
import 'package:fitguide_exercise/widgets/buttons/button_full.dart';
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
  bool isFavorite = false;
  late PreferencesUtils preferencesUtils;
  FavoriteManager favoriteManager = FavoriteManager();
  bool? loginStatus = false;

  void init() async {
    preferencesUtils = PreferencesUtils();
    await preferencesUtils.init();
    setState(() {
      loginStatus = preferencesUtils.getPreferencesBool('loginStatus');
    });
  }

  YoutubeAPI youtube =
      YoutubeAPI(YoutubeApi.apiKey, maxResults: 1, type: 'Video');
  List<YouTubeVideo> videoResult = [];

  Future<void> callAPI() async {
    videoResult = await youtube.search(
      "${widget.name} exercise tutorial",
      order: 'relevance',
      videoDuration: 'any',
    );
    setState(() {});
  }

  Future<void> toggleFavoriteExercise() async {
    if (isFavorite) {
      await favoriteManager.removeFavoriteExercise(widget.name);
    } else {
      await favoriteManager.addWishlistItem(
        widget.name,
        widget.type,
        widget.muscle,
        widget.equipment,
        widget.difficulty,
        widget.instructions,
      );
    }

    setState(() {
      isFavorite = !isFavorite;
    });
  }

  Future<void> checkFavoriteStatus() async {
    List wishlist = await favoriteManager.getFavourite();

    setState(() {
      isFavorite = wishlist.any((item) => item.name == widget.name);
    });
  }

  @override
  void didUpdateWidget(covariant DetailedExercise oldWidget) {
    super.didUpdateWidget(oldWidget);
    checkFavoriteStatus();
  }

  @override
  void initState() {
    super.initState();
    callAPI();
    init();
    checkFavoriteStatus();
  }

  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'cxQMLCtoi_w',
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
      hideThumbnail: true,
      showLiveFullscreenButton: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        children: [
          FadeInImage(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            placeholder: const AssetImage("assets/images/placeholder.png"),
            image: const NetworkImage(
                "https://images.pexels.com/photos/2827392/pexels-photo-2827392.jpeg"),
            imageErrorBuilder: (context, error, stackTrace) {
              return const Center(
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
                  //Back Button
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: primaryColor,
                    ),
                  ),
                  const Spacer(),
                  loginStatus!
                      // Favorite Button
                      ? IconButton(
                          onPressed: () async {
                            toggleFavoriteExercise();
                          },
                          icon: isFavorite
                              ? Icon(
                                  Icons.favorite,
                                  color: primaryColor,
                                )
                              : Icon(
                                  Icons.favorite_border,
                                  color: primaryColor,
                                ),
                        )
                      : Container(),
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
      decoration: const BoxDecoration(
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
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
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
            const SizedBox(height: 30),
            Text(
              widget.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Difficulty',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: ButtonFull(
                      title: widget.difficulty,
                      color: primaryColor,
                      textColor: whiteColor,
                      press: () => null),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Exercise Type',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: ButtonFull(
                      title: widget.type,
                      color: primaryColor,
                      textColor: whiteColor,
                      press: () => null),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Equipment',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: ButtonFull(
                      title: widget.equipment,
                      color: primaryColor,
                      textColor: whiteColor,
                      press: () => null),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Muscle ',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: ButtonFull(
                      title: widget.muscle,
                      color: primaryColor,
                      textColor: whiteColor,
                      press: () => null),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 12),
            Text(
              'Instruction',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey[700],
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.instructions,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Tutorial Video',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey[700],
                fontWeight: FontWeight.bold,
              ),
            ),
            ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: videoResult.map<Widget>(listItem).toList(),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget listItem(YouTubeVideo video) {
    String id = video.id.toString();
    return YoutubePlayer(
      progressIndicatorColor: primaryColor,
      controller: _controller,
      showVideoProgressIndicator: true,
      bottomActions: [
        CurrentPosition(),
        ProgressBar(isExpanded: true),
      ],
      onReady: () {
        _controller.load(id);
        _controller.pause();
      },
    );
  }
}
