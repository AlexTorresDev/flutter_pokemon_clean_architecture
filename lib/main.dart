import 'package:flutter/material.dart';
import 'package:flutter_pokemon_clean_architecture/injection.dart' as di;
import 'package:flutter_pokemon_clean_architecture/ui/my_app.dart';

void main() {
  di.init();
  runApp(const MyApp());
}
