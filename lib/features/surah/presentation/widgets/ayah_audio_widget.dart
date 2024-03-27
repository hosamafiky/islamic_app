import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/core/extensions/sizing_ext.dart';
import 'package:islamic_app/core/extensions/svg_extension.dart';
import 'package:islamic_app/core/helpers/audio_players_helper.dart';
import 'package:islamic_app/core/resources/assets_manager.dart';

class AyahAudioWidget extends StatelessWidget {
  const AyahAudioWidget({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    final audioPlayerHelper = context.read<AudioPlayerHelper>();
    return StreamBuilder<PlayerState>(
      stream: audioPlayerHelper.stateStream,
      builder: (context, stateSnapshot) {
        final isPlaying = stateSnapshot.data == PlayerState.playing;
        return Stack(
          alignment: Alignment.center,
          children: [
            GestureDetector(
              onTap: () {
                if (isPlaying) {
                  audioPlayerHelper.pause();
                  return;
                } else {
                  audioPlayerHelper.play();
                }
              },
              child: isPlaying
                  ? AssetsManager.icons.svg.pause.asSvg(width: 20.aw, height: 20.ah)
                  : AssetsManager.icons.svg.play.asSvg(width: 24.aw, height: 24.ah),
            ),
          ],
        );
      },
    );
  }
}
