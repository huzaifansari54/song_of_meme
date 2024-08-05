import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:song_of_meme/src/core/constant/colors_const.dart';
import 'package:song_of_meme/src/features/memeOfSong/view/widget/slider_widget.dart';

class ControlButtons extends StatelessWidget {
  final AudioPlayer player;

  const ControlButtons(this.player, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: lightBlackColor, borderRadius: BorderRadius.circular(25)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Opens volume slider dialog
          IconButton(
            color: greenColor,
            icon: const Icon(Icons.volume_up_outlined),
            onPressed: () {
              showSliderDialog(
                context: context,
                title: "Adjust volume",
                divisions: 10,
                min: 0.0,
                max: 1.0,
                value: player.volume,
                stream: player.volumeStream,
                onChanged: player.setVolume,
              );
            },
          ),

          /// This StreamBuilder rebuilds whenever the player state changes, which
          /// includes the playing/paused state and also the
          /// loading/buffering/ready state. Depending on the state we show the
          /// appropriate button or loading indicator.
          StreamBuilder<PlayerState>(
            stream: player.playerStateStream,
            builder: (context, snapshot) {
              final playerState = snapshot.data;
              final processingState = playerState?.processingState;
              final playing = playerState?.playing;
              if (processingState == ProcessingState.loading ||
                  processingState == ProcessingState.buffering) {
                return Container(
                  margin: const EdgeInsets.all(8.0),
                  width: 40.0,
                  height: 40.0,
                  child: const CircularProgressIndicator(
                    color: greenColor,
                  ),
                );
              } else if (playing != true) {
                return IconButton(
                  color: greenColor,
                  icon: const Icon(Icons.play_arrow_outlined),
                  iconSize: 64.0,
                  onPressed: player.play,
                );
              } else if (processingState != ProcessingState.completed) {
                return IconButton(
                  color: greenColor,
                  icon: const Icon(Icons.pause_outlined),
                  iconSize: 64.0,
                  onPressed: player.pause,
                );
              } else {
                return IconButton(
                  color: greenColor,
                  icon: const Icon(Icons.replay),
                  iconSize: 64.0,
                  onPressed: () => player.seek(Duration.zero),
                );
              }
            },
          ),
          // Opens speed slider dialog
          StreamBuilder<double>(
            stream: player.speedStream,
            builder: (context, snapshot) => IconButton(
              color: whiteColor,
              icon: Text("${snapshot.data?.toStringAsFixed(1)}x",
                  style: const TextStyle(
                      color: greenColor, fontWeight: FontWeight.bold)),
              onPressed: () {
                showSliderDialog(
                  context: context,
                  title: "Adjust speed",
                  divisions: 10,
                  min: 0.5,
                  max: 1.5,
                  value: player.speed,
                  stream: player.speedStream,
                  onChanged: player.setSpeed,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
