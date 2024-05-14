import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:islamic_app/core/extensions/sizing_ext.dart';
import 'package:islamic_app/core/extensions/svg_extension.dart';
import 'package:islamic_app/core/helpers/firebase_messaging_helper.dart';
import 'package:islamic_app/core/resources/assets_manager.dart';
import 'package:islamic_app/features/home/presentation/widgets/last_read_widget.dart';
import 'package:islamic_app/features/home/presentation/widgets/tabbar_widget.dart';
import 'package:islamic_app/features/quran/presentation/widgets/quran_juzs_list.dart';
import 'package:islamic_app/features/quran/presentation/widgets/quran_pages_list.dart';
import 'package:islamic_app/features/theme/presentation/widgets/change_theme_mode_button.dart';
import 'package:islamic_app/firebase_options.dart';

import '../../../quran/presentation/widgets/quran_surahs_list.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    _initializeFCM();
    super.initState();
  }

  _initializeFCM() async {
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    await FirebaseMessagingHelper.instance.initialize(
      Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          titleSpacing: 27.aw,
          leading: IconButton(
            icon: AssetsManager.icons.svg.menu.asSvg(width: 24.aw, height: 24.aw),
            onPressed: () {},
          ),
          actions: const [ChangeThemeModeButton()],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.aw),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Asslamualaikum',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Text(
                'Brother',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              24.vsb,
              const LastReadWidget(),
              const TabbarWidget(),
              const Expanded(
                child: TabBarView(
                  children: [
                    QuranSurahsList(),
                    QuranJuzsList(),
                    QuranPagesList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
