import 'package:flutter/material.dart';
import 'package:flutter_pokemon_clean_architecture/src/presentation/pages/details/widgets/body.dart';
import 'package:flutter_pokemon_clean_architecture/src/presentation/providers/pokemon/pokemon_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailsPage extends ConsumerWidget {
  const DetailsPage({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemon = ref.watch(pokemonByNameProvider(name));

    return Scaffold(
      appBar: AppBar(title: Text('Details $name')),
      body: pokemon.when(
        data: (pokemon) => DetailsBody(pokemon: pokemon),
        error: (error, stack) => Center(child: Text('Error: $error')),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
