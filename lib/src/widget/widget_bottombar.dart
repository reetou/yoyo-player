import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:yoyo_player/src/responses/play_response.dart';

Widget bottomBar(
    {VideoPlayerController controller,
    String videoSeek,
    String videoDuration,
    bool showMeau,
    Function play}) {
  return showMeau
      ? Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 40,
            child: Padding(
              padding: EdgeInsets.all(0.0),
              child: Stack(
                children: [
                  Column(
                    children: [
                      VideoProgressIndicator(
                        controller,
                        allowScrubbing: true,
                        colors: VideoProgressColors(
                            playedColor: Color(0xffffffff)),
                        padding: EdgeInsets.only(left: 5.0, right: 5),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              videoSeek,
                              style: TextStyle(
                                  color: Colors.white),
                            ),
                            Text(
                              videoDuration,
                              style: TextStyle(
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            onTap: () {
                              rewind(controller);
                            },
                            child: Icon(
                              Icons.skip_previous,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: InkWell(
                              onTap: play,
                              child: Icon(
                                controller.value.isPlaying
                                    ? Icons.play_circle_outline
                                    : Icons.pause_circle_outline,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              fastForward(controller: controller);
                            },
                            child: Icon(
                              Icons.skip_next,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      : Container();
}
