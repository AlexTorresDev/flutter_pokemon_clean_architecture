import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_pokemon_clean_architecture/injection.dart' as di;
import 'package:flutter_pokemon_clean_architecture/ui/blocs/pokemon/pokemon_bloc.dart';
import 'package:flutter_pokemon_clean_architecture/ui/pages/home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final Color _color = Colors.amber;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.injector<PokemonBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: const HomePage(),
        theme: ThemeData(
          primaryColor: _color,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: _color,
          ),
          inputDecorationTheme: InputDecorationTheme(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: _color,
              ),
            ),
            prefixIconColor: _color,
          ),
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: _color,
          ),
        ),
      ),
    );
  }
}
