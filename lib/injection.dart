import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_pokemon_clean_architecture/data/database.dart';
import 'package:flutter_pokemon_clean_architecture/data/data_sources/local_data_source.dart';
import 'package:flutter_pokemon_clean_architecture/data/data_sources/remote_data_source.dart';
import 'package:flutter_pokemon_clean_architecture/data/repositories/pokemon_repository_impl.dart';
import 'package:flutter_pokemon_clean_architecture/domain/repositories/pokemon_repository.dart';
import 'package:flutter_pokemon_clean_architecture/domain/use_cases/get_pokemon.dart';
import 'package:flutter_pokemon_clean_architecture/domain/use_cases/get_pokemon_list.dart';
import 'package:flutter_pokemon_clean_architecture/ui/blocs/blocs.dart';

final injector = GetIt.instance;

void init() {
  // BLoC
  injector.registerFactory(() => PokemonBloc(injector(), injector()));
  injector.registerFactory(() => DetailsBloc(injector()));

  // Use case
  injector.registerLazySingleton(() => GetPokemonList(injector()));
  injector.registerLazySingleton(() => GetPokemon(injector()));

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

  // Core
  injector.registerLazySingleton(() => http.Client());
  injector.registerLazySingleton(() => DBProvider.instance);
}
