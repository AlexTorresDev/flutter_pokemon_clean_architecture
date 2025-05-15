// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get loginTitle => 'Login';

  @override
  String get loginUsername => 'Username';

  @override
  String get loginPassword => 'Password';

  @override
  String get loginSubmit => 'Login';

  @override
  String get loginError => 'Invalid username or password';

  @override
  String get logout => 'You have been logged out';

  @override
  String get loginFingerPrint => 'Fingerprint';

  @override
  String get pokemonLoading => 'Your Pokedex is loading...';

  @override
  String get pokemonNotFound => 'Pokemon not found';
}
