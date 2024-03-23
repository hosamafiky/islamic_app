import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:islamic_app/core/extensions/sizing_ext.dart';
import 'package:islamic_app/core/extensions/svg_extension.dart';
import 'package:islamic_app/core/helpers/firebase_messaging_helper.dart';
import 'package:islamic_app/core/resources/assets_manager.dart';
import 'package:islamic_app/core/utils/app_text_styles.dart';
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
        appBar: AppBar(
          title: Text(widget.title),
          titleSpacing: 27.aw,
          leading: IconButton(
            icon: AssetsManager.icons.svg.menu.asSvg(width: 24.aw, height: 24.aw),
            onPressed: () {},
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.aw),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Asslamualaikum',
                style: LightAppTextStyles.medium18,
              ),
              Text(
                'Brother',
                style: LightAppTextStyles.semiBold24,
              ),
              24.vsb,
              Container(
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
                          style: LightAppTextStyles.medium14.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      'Al-Fatiah',
                      style: LightAppTextStyles.whiteSemiBold18.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    4.vsb,
                    Text(
                      'Ayah : 1-7',
                      style: LightAppTextStyles.regular14.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              24.vsb,
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
