import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokemon_clean_architecture/ui/blocs/blocs.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    Key? key,
    @PathParam() required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is PokemonLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PokemonHasList) {
            final pokemon = state.result[0];
            return Text(pokemon.name!);
          } else {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
        },
      ),
    );
  }
}
