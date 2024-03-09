part of 'themes.dart';

class DarkTheme {
  static ThemeData get data => ThemeData(
        fontFamily: 'Poppins',
        brightness: Brightness.dark,
        scaffoldBackgroundColor: DarkAppColors.background,
        appBarTheme: const AppBarTheme(
          color: DarkAppColors.background,
          elevation: 0,
          centerTitle: false,
          surfaceTintColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
          ),
          titleTextStyle: TextStyle(
            fontFamily: 'Poppins',
            color: DarkAppColors.iconColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
            color: DarkAppColors.iconColor,
          ),
        ),
        primaryColor: DarkAppColors.primary,
      );
}
