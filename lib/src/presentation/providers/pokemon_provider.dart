import 'package:flutter_pokemon_clean_architecture/src/core/connections/db_provider.dart';
import 'package:flutter_pokemon_clean_architecture/src/core/network/client_service.dart';
import 'package:flutter_pokemon_clean_architecture/src/data/data_sources/local_data_source.dart';
import 'package:flutter_pokemon_clean_architecture/src/data/data_sources/remote_data_source.dart';
import 'package:flutter_pokemon_clean_architecture/src/data/repositories/pokemon_repository_impl.dart';
import 'package:flutter_pokemon_clean_architecture/src/domain/entities/pokemon.dart';
import 'package:flutter_pokemon_clean_architecture/src/domain/usecases/pokemon/pokemon_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final clientProvider = Provider<ClientService>((ref) {
  return ClientService();
});

final dbProvider = Provider<DBProvider>((ref) {
  return DBProvider.instance;
});

final pokemonUseCaseProvider = Provider<PokemonUsecase>((ref) {
  final clientService = ref.watch(clientProvider);
  final db = ref.watch(dbProvider);
  return PokemonUsecase(
    PokemonRepositoryImpl(
      remoteDataSource: RemoteDataSourceImpl(client: clientService),
      localDataSource: LocalDataSourceImpl(dbProvider: db),
    ),
  );
});

final pokemonProvider = Provider<Future<List<Pokemon>>>((ref) {
  final useCase = ref.watch(pokemonUseCaseProvider);
  return useCase
      .getAll(0, 20)
      .then((value) => value.fold((l) => throw Exception(l.message), (r) => r));
});
