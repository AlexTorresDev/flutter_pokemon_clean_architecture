import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_pokemon_clean_architecture/core/connections/network_connectivity.dart';
import 'package:flutter_pokemon_clean_architecture/injection.dart' as di;
import 'package:flutter_pokemon_clean_architecture/ui/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NetworkConnectivity.instance.init();
  di.init();

  const environment =
      String.fromEnvironment('ENVIRONMENT', defaultValue: 'development');
  await dotenv.load(fileName: 'assets/env/.env.$environment');

  runApp(MyApp());
}
