import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/features/theme/presentation/cubit/theme_cubit.dart';

class ChangeThemeModeButton extends StatelessWidget {
  const ChangeThemeModeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return IconButton(
          icon: Icon(
            state.themeMode == ThemeMode.dark ? Icons.brightness_4 : Icons.brightness_low_sharp,
          ),
          onPressed: () => context.read<ThemeCubit>().changeTheme(),
        );
      },
    );
  }
}
