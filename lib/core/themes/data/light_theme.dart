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
      );
}
