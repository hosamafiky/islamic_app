import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/core/extensions/sizing_ext.dart';
import 'package:islamic_app/core/extensions/svg_extension.dart';
import 'package:islamic_app/core/resources/assets_manager.dart';
import 'package:islamic_app/core/utils/app_text_styles.dart';
import 'package:islamic_app/features/last_read/presentation/cubit/last_read_cubit.dart';

class LastReadWidget extends StatefulWidget {
  const LastReadWidget({super.key});

  @override
  State<LastReadWidget> createState() => _LastReadWidgetState();
}

class _LastReadWidgetState extends State<LastReadWidget> {
  @override
  void initState() {
    context.read<LastReadCubit>().loadLastRead();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LastReadCubit, LastReadState>(
      builder: (context, state) {
        if (state.surah == null) return const Offstage();
        return Container(
          height: 131.ah,
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetsManager.images.lastRead),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  AssetsManager.icons.svg.readme.asSvg(
                    width: 24.aw,
                    height: 24.ah,
                  ),
                  SizedBox(width: 8.aw),
                  Text(
                    'Last Read',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              const Spacer(),
              Text(
                state.surah!.englishName,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              4.vsb,
              Text(
                'Ayah : ${state.startVerse}-${state.endVerse}',
                style: LightAppTextStyles.regular14.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
