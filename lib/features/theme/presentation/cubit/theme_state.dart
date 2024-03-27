part of 'theme_cubit.dart';

abstract class ThemeState extends Equatable {
  const ThemeState({
    this.themeMode = ThemeMode.light,
  });

  final ThemeMode themeMode;

  @override
  List<Object> get props => [themeMode];
}

class ThemeInitial extends ThemeState {}

class ThemeChanged extends ThemeState {
  const ThemeChanged(ThemeMode themeMode) : super(themeMode: themeMode);
}
