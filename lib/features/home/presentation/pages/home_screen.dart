import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:islamic_app/core/helpers/firebase_messaging_helper.dart';
import 'package:islamic_app/features/home/presentation/widgets/tabbar_widget.dart';
import 'package:islamic_app/features/quran/presentation/widgets/quran_juzs_list.dart';
import 'package:islamic_app/features/quran/presentation/widgets/quran_pages_list.dart';
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
        appBar: AppBar(title: Text(widget.title)),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              TabbarWidget(),
              Expanded(
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
