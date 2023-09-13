part of 'language_provider.dart';

abstract class LanguageState {
  const LanguageState();
}

class LanguageInitial extends LanguageState {}

class LanguageLoading extends LanguageState {}

class LanguageChanged extends LanguageState {}

class LanguageError extends LanguageState {
  final String message;
  const LanguageError(this.message);
}
