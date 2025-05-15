// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get loginTitle => 'Inicio de sesion';

  @override
  String get loginUsername => 'Nombre de usuario';

  @override
  String get loginPassword => 'Contraseña';

  @override
  String get loginSubmit => 'Iniciar sesion';

  @override
  String get loginError => 'Nombre de usuario o contraseña incorrectos';

  @override
  String get logout => 'Cerrar sesion';

  @override
  String get loginFingerPrint => 'Iniciar sesion con huella digital';

  @override
  String get pokemonLoading => 'Cargando Pokedex...';

  @override
  String get pokemonNotFound => 'No se encontraron pokemon';
}
