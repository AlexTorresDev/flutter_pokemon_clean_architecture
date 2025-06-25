import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_pokemon_clean_architecture/src/domain/providers.dart';
import 'package:flutter_pokemon_clean_architecture/src/domain/models/pokemon.dart';

class PokemonQueryParams {
  PokemonQueryParams({required this.limit, required this.offset});
  final int limit;
  final int offset;
}

final pokemonProvider = FutureProvider.autoDispose
    .family<List<PokemonModel>, PokemonQueryParams>(
      (ref, params) => ref
          .watch(pokemonUseCaseProvider)
          .getAll(params.limit, params.offset)
          .then(
            (value) => value.fold((l) => throw Exception(l.message), (r) => r),
          ),
    );
