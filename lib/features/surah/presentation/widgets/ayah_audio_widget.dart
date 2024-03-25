import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/core/extensions/sizing_ext.dart';
import 'package:islamic_app/core/extensions/svg_extension.dart';
import 'package:islamic_app/core/helpers/audio_players_helper.dart';
import 'package:islamic_app/core/resources/assets_manager.dart';
import 'package:islamic_app/core/themes/data/themes.dart';

class AyahAudioWidget extends StatelessWidget {
  const AyahAudioWidget({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AudioPlayerHelper()..setSource(url),
      child: Builder(
        builder: (context) {
          return StreamBuilder<bool>(
            stream: context.read<AudioPlayerHelper>().stateStream,
            builder: (context, stateSnapshot) {
              final bool isPlaying = stateSnapshot.data ?? false;
              return Stack(
                alignment: Alignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (isPlaying) {
                        context.read<AudioPlayerHelper>().pause();
                        return;
                      }
                      context.read<AudioPlayerHelper>().play();
                    },
                    child: isPlaying
                        ? AssetsManager.icons.svg.pause.asSvg(width: 20.aw, height: 20.ah)
                        : AssetsManager.icons.svg.play.asSvg(width: 24.aw, height: 24.ah),
                  ),
                  if (isPlaying)
                    SizedBox(
                      width: 24.aw,
                      height: 24.aw,
                      child: StreamBuilder<Duration?>(
                        stream: context.read<AudioPlayerHelper>().durationStream,
                        builder: (context, durationSnapshot) {
                          final duration = durationSnapshot.data ?? const Duration(seconds: 1);
                          return StreamBuilder<Duration>(
                            stream: context.read<AudioPlayerHelper>().positionStream,
                            builder: (context, positionSnapshot) {
                              final position = positionSnapshot.data ?? Duration.zero;
                              if (position == duration) context.read<AudioPlayerHelper>().stop();
                              return CircularProgressIndicator(
                                strokeWidth: 2,
                                strokeCap: StrokeCap.round,
                                valueColor: const AlwaysStoppedAnimation(LightAppColors.primaryColor),
                                value: position.inSeconds / duration.inSeconds,
                              );
                            },
                          );
                        },
                      ),
                    ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
