part of 'theme_provider.dart';

abstract class ThemeState {
  const ThemeState();
}

class ThemeInitial extends ThemeState {}

class ThemeLoading extends ThemeState {}

class ThemeChanged extends ThemeState {}

class ThemeError extends ThemeState {
  final String message;
  const ThemeError(this.message);
}
