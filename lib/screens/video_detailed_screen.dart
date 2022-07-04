import 'package:noflix/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoDetailedScreen extends StatefulWidget {
  _VideoDetailedScreenState createState() => _VideoDetailedScreenState();
}

class _VideoDetailedScreenState extends State<VideoDetailedScreen> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = YoutubePlayerController(
        initialVideoId: 'atwWbkBdepE',
        params: const YoutubePlayerParams(
            autoPlay: true,
            showControls: false,
            showFullscreenButton: true,
            desktopMode: true,
            privacyEnhanced: true,
            useHybridComposition: true));
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: Icon(Icons.collections_bookmark_rounded),
              onPressed: () => print('collection bookmark'),
            ),
          ),
          AppBarButtons()
        ],
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    const player = YoutubePlayerIFrame();

    final size = MediaQuery.of(context).size;
    return YoutubePlayerControllerProvider(
      // Provides controller to all the widget below it.
      controller: _controller,
      child: Container(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Container(
              height: 220,
              child: Stack(
                children: [
                  const Positioned(
                      left: 0, right: 0, child: Expanded(child: player)),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ),
                  YoutubeValueBuilder(
                    controller: _controller,
                    builder: (BuildContext context, value) {
                      return Center(
                        child: IconButton(
                          icon: Icon(
                              value.playerState == PlayerState.playing
                                  ? null
                                  : Icons.play_arrow,
                              color: Colors.white,
                              size: 50.0),
                          onPressed: () {
                            setState(() {
                              value.playerState == PlayerState.playing
                                  ? _controller.pause()
                                  : _controller.play();
                            });
                          },
                        ),
                      );
                    },

                    // progressIndicatorColor: Colors.red,
                  ),
                  Positioned(
                    left: 5.0,
                    bottom: 20,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 13.0, vertical: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6.0, vertical: 4),
                              child: Text('Preview',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 5.0,
                    bottom: 20,
                    child: Container(
                      width: 25.0,
                      height: 35.0,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.volume_mute,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: size.height - 330,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Age of Sumuria, Battle for Japan',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            height: 1.4,
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text('Match',
                              style: TextStyle(
                                color: Colors.green.withOpacity(0.9),
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              )),
                          const SizedBox(width: 15),
                          Text('2022',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.4),
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              )),
                          const SizedBox(width: 15),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 6),
                            color: Colors.grey[700],
                            child: Text('18+',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                )),
                          ),
                          const SizedBox(width: 15),
                          Text('1 season',
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              )),
                          const SizedBox(width: 15),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 6),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.white.withOpacity(0.4),
                                    style: BorderStyle.solid,
                                    width: 1.0),
                                borderRadius: BorderRadius.circular(2.5)),
                            child: Text(
                              'HD',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.4),
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Watch Sesason 1 Now',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
