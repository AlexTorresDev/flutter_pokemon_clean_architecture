import 'package:flutter_pokemon_clean_architecture/src/data/providers.dart';
import 'package:flutter_pokemon_clean_architecture/src/domain/usecases/pokemon/pokemon_use_case.dart';
import 'package:flutter_pokemon_clean_architecture/src/infrastructure/adapters/api/pokemon_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pokemonApiProvider = Provider<PokemonApi>((ref) {
  final remote = ref.watch(remoteDataSourceProvider);
  final local = ref.watch(localDataSourceProvider);
  return PokemonApi(remoteDataSource: remote, localDataSource: local);
});

final pokemonUseCaseProvider = Provider<PokemonUsecase>((ref) {
  final api = ref.watch(pokemonApiProvider);
  return PokemonUsecase(api);
});
