import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokemon_clean_architecture/core/framework/router/router.gr.dart';
import 'package:flutter_pokemon_clean_architecture/core/framework/utils/custom_shape_border.dart';

import 'package:flutter_pokemon_clean_architecture/injection.dart' as di;
import 'package:flutter_pokemon_clean_architecture/ui/blocs/blocs.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _color = Colors.teal;
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.injector<PokemonBloc>(),
        ),
        BlocProvider(
          create: (_) => di.injector<DetailsBloc>(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        theme: ThemeData(
          primaryColor: _color,
          appBarTheme: AppBarTheme(
            backgroundColor: _color,
            shape: CustomShapeBorder(),
          ),
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
          progressIndicatorTheme: ProgressIndicatorThemeData(
            color: _color,
          ),
        ),
      ),
    );
  }
}
