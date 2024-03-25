part of 'themes.dart';

class DarkTheme {
  static ThemeData get data => ThemeData(
        fontFamily: 'Poppins',
        brightness: Brightness.dark,
        scaffoldBackgroundColor: DarkAppColors.background,
        appBarTheme: AppBarTheme(
          color: DarkAppColors.background,
          elevation: 0,
          centerTitle: false,
          surfaceTintColor: Colors.transparent,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
          ),
          titleTextStyle: LightAppTextStyles.bold20.copyWith(color: Colors.white),
          iconTheme: const IconThemeData(color: DarkAppColors.iconColor),
        ),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.white,
          unselectedLabelColor: LightAppColors.unselectedLabelColor,
          labelStyle: LightAppTextStyles.semiBold16,
          unselectedLabelStyle: LightAppTextStyles.medium16,
          dividerHeight: 3,
          dividerColor: LightAppColors.tabbarDividerColor,
          indicator: const BoxDecoration(
            border: Border(bottom: BorderSide(color: LightAppColors.labelColor, width: 3)),
          ),
        ),
        textTheme: TextTheme(
          displayMedium: LightAppTextStyles.medium18.copyWith(color: DarkAppColors.iconColor),
          headlineMedium: LightAppTextStyles.semiBold24.copyWith(color: Colors.white),
          titleMedium: LightAppTextStyles.medium14.copyWith(color: Colors.white),
          titleLarge: LightAppTextStyles.whiteSemiBold18.copyWith(color: Colors.white),
          titleSmall: LightAppTextStyles.regular14.copyWith(color: Colors.white),
          bodyMedium: LightAppTextStyles.amiriBold18.copyWith(color: Colors.white),
        ),
        listTileTheme: ListTileThemeData(
          visualDensity: VisualDensity.compact,
          tileColor: DarkAppColors.background,
          titleTextStyle: LightAppTextStyles.medium16.copyWith(color: Colors.white),
          subtitleTextStyle: LightAppTextStyles.medium12.copyWith(color: DarkAppColors.iconColor),
          leadingAndTrailingTextStyle: LightAppTextStyles.amiriBold20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        cardColor: DarkAppColors.card,
        primaryColor: DarkAppColors.primary,
      );
}
