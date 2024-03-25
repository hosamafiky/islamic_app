part of 'themes.dart';

class LightTheme {
  static ThemeData get data => ThemeData(
        fontFamily: 'Poppins',
        brightness: Brightness.light,
        scaffoldBackgroundColor: LightAppColors.scaffoldBackgroundColor,
        appBarTheme: AppBarTheme(
          color: LightAppColors.scaffoldBackgroundColor,
          elevation: 0,
          centerTitle: false,
          surfaceTintColor: Colors.transparent,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
          titleTextStyle: LightAppTextStyles.bold20,
          iconTheme: const IconThemeData(
            color: LightAppColors.iconColor,
          ),
        ),
        cardColor: LightAppColors.cardColor,
        tabBarTheme: TabBarTheme(
          labelColor: LightAppColors.primaryColor,
          unselectedLabelColor: LightAppColors.unselectedLabelColor,
          labelStyle: LightAppTextStyles.semiBold16,
          unselectedLabelStyle: LightAppTextStyles.medium16,
          dividerHeight: 3,
          dividerColor: LightAppColors.tabbarDividerColor,
          indicator: const BoxDecoration(
            border: Border(bottom: BorderSide(color: LightAppColors.labelColor, width: 3)),
          ),
        ),
        primaryColor: LightAppColors.primaryColor,
        primaryColorDark: LightAppColors.primaryColorDark,
        dividerTheme: DividerThemeData(
          color: LightAppColors.dividerColor.withOpacity(0.35),
        ),
        textTheme: TextTheme(
          displayMedium: LightAppTextStyles.medium18,
          headlineMedium: LightAppTextStyles.semiBold24,
          titleMedium: LightAppTextStyles.medium14.copyWith(color: Colors.white),
          titleLarge: LightAppTextStyles.whiteSemiBold18.copyWith(color: Colors.white),
          titleSmall: LightAppTextStyles.regular14.copyWith(color: Colors.white),
          bodyMedium: LightAppTextStyles.amiriBold18,
        ),
        listTileTheme: ListTileThemeData(
          visualDensity: VisualDensity.compact,
          tileColor: LightAppColors.scaffoldBackgroundColor,
          titleTextStyle: LightAppTextStyles.medium16,
          subtitleTextStyle: LightAppTextStyles.medium12,
          leadingAndTrailingTextStyle: LightAppTextStyles.amiriBold20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
}
