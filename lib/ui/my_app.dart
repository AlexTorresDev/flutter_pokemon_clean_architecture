import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_pokemon_clean_architecture/injection.dart' as di;
import 'package:flutter_pokemon_clean_architecture/ui/blocs/pokemon/pokemon_bloc.dart';
import 'package:flutter_pokemon_clean_architecture/ui/pages/home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.injector<PokemonBloc>(),
        ),
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: HomePage(),
      ),
    );
  }
}
