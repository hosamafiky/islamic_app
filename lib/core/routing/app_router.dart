import 'package:flutter/material.dart';
import 'package:islamic_app/features/home/presentation/pages/home_screen.dart';
import 'package:islamic_app/features/quran/domain/entities/surah.dart';
import 'package:islamic_app/features/surah/presentation/pages/surah_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(title: 'Islamic App'),
        );
      case SurahScreen.routeName:
        final surah = settings.arguments as Surah;
        return MaterialPageRoute(
          builder: (_) => SurahScreen(surah),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
