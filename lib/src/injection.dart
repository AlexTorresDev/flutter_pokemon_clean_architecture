import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_pokemon_clean_architecture/src/core/connections/db_provider.dart';
import 'package:flutter_pokemon_clean_architecture/src/data/data_sources/local_data_source.dart';
import 'package:flutter_pokemon_clean_architecture/src/data/data_sources/remote_data_source.dart';
import 'package:flutter_pokemon_clean_architecture/src/data/repositories/pokemon_repository_impl.dart';
import 'package:flutter_pokemon_clean_architecture/src/domain/repositories/pokemon_repository.dart';
import 'package:flutter_pokemon_clean_architecture/src/domain/use_cases/get_pokemon.dart';
import 'package:flutter_pokemon_clean_architecture/src/domain/use_cases/get_pokemon_list.dart';
import 'package:flutter_pokemon_clean_architecture/src/presentation/blocs/blocs.dart';

final injector = GetIt.instance;

void init() {
  // Core
  injector.registerLazySingleton(() => http.Client());
  injector.registerLazySingleton(() => DBProvider.instance);

  // Use case
  injector.registerLazySingleton(() => GetPokemonList(injector()));
  injector.registerLazySingleton(() => GetPokemon(injector()));

  // BLoC
  injector.registerFactory(() => PokemonCubit(injector(), injector()));
  injector.registerFactory(() => DetailsBloc(injector()));

  // Repository
  injector.registerLazySingleton<PokemonRepository>(() => PokemonRepositoryImpl(
        remoteDataSource: injector(),
        localDataSource: injector(),
      ));

  // Data sources
  injector.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(client: injector()));
  injector.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImpl(dbProvider: injector()));
}
