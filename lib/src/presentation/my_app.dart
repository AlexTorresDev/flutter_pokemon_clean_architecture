import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter_pokemon_clean_architecture/l10n/app_localizations.dart';
import 'package:flutter_pokemon_clean_architecture/src/config/router/router.dart';
import 'package:flutter_pokemon_clean_architecture/src/config/themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightColorScheme, darkColorScheme) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          localeResolutionCallback: (locale, supportedLocales) => locale,
          theme: ThemeData(
            colorScheme: lightColorScheme ?? AppTheme.defaultLightColorScheme,
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: darkColorScheme ?? AppTheme.defaultDarkColorScheme,
            useMaterial3: true,
          ),
        );
      },
    );
  }
}
