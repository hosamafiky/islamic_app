part of 'themes.dart';

class LightTheme {
  static ThemeData get data => ThemeData(
        fontFamily: 'Poppins',
        brightness: Brightness.light,
        scaffoldBackgroundColor: LightAppColors.scaffoldBackgroundColor,
        appBarTheme: const AppBarTheme(
          color: LightAppColors.scaffoldBackgroundColor,
          elevation: 0,
          centerTitle: false,
          surfaceTintColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
          titleTextStyle: TextStyle(
            fontFamily: 'Poppins',
            color: LightAppColors.primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
            color: LightAppColors.iconColor,
          ),
        ),
        primaryColor: LightAppColors.primaryColor,
        primaryColorDark: LightAppColors.primaryColorDark,
        dividerTheme: DividerThemeData(
          color: LightAppColors.dividerColor.withOpacity(0.35),
        ),
      );
}
