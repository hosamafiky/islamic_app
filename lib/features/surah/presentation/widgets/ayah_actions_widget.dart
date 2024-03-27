import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/core/extensions/sizing_ext.dart';
import 'package:islamic_app/core/extensions/svg_extension.dart';
import 'package:islamic_app/core/helpers/audio_players_helper.dart';
import 'package:islamic_app/core/resources/assets_manager.dart';
import 'package:islamic_app/core/themes/data/themes.dart';
import 'package:islamic_app/features/surah/domain/entities/ayah.dart';

import 'ayah_audio_widget.dart';

class AyahActionsWidget extends StatelessWidget {
  const AyahActionsWidget({super.key, required this.ayah});

  final Ayah ayah;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AudioPlayerHelper()..setSource(ayah.audio),
      child: Builder(builder: (context) {
        final audioPlayerHelper = context.read<AudioPlayerHelper>();
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 13.aw, vertical: 10.ah),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 13.5,
                backgroundColor: LightAppColors.primaryColor,
                child: Center(
                  child: Text(
                    ayah.numberInSurah.toString(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              _PlayerSlider(
                positionStream: audioPlayerHelper.positionStream,
                durationStream: audioPlayerHelper.durationStream,
              ),
              GestureDetector(
                onTap: () {},
                child: AssetsManager.icons.svg.share.asSvg(
                  width: 24.aw,
                  height: 24.ah,
                ),
              ),
              16.hsb,
              AyahAudioWidget(url: ayah.audio),
              16.hsb,
              GestureDetector(
                onTap: () {},
                child: AssetsManager.icons.svg.bookmark.asSvg(
                  width: 24.aw,
                  height: 24.ah,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class _PlayerSlider extends StatelessWidget {
  const _PlayerSlider({required this.positionStream, required this.durationStream});

  final Stream<Duration> positionStream;
  final Stream<Duration> durationStream;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Duration>(
      stream: durationStream,
      builder: (context, durationSnapshot) {
        final duration = durationSnapshot.data ?? Duration.zero;
        return StreamBuilder<Duration>(
          stream: positionStream,
          builder: (context, snapshot) {
            final position = snapshot.data ?? Duration.zero;
            if (position == Duration.zero) return const Spacer();
            return Expanded(
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 2,
                  thumbColor: LightAppColors.primaryColor,
                  overlayShape: const RoundSliderOverlayShape(overlayRadius: 10),
                  activeTrackColor: LightAppColors.primaryColor,
                  inactiveTrackColor: LightAppColors.primaryColor.withOpacity(0.35),
                ),
                child: Slider(
                  min: 0,
                  max: duration.inMicroseconds.toDouble(),
                  value: position.inMicroseconds.toDouble(),
                  onChangeStart: (duration) => context.read<AudioPlayerHelper>().pause(),
                  onChanged: (duration) => context.read<AudioPlayerHelper>().seek(Duration(microseconds: duration.toInt())),
                  onChangeEnd: (duration) => context.read<AudioPlayerHelper>().play(),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
