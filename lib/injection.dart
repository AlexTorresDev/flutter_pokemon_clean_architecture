import 'package:flutter_pokemon_clean_architecture/ui/blocs/pokemon/pokemon_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_pokemon_clean_architecture/data/data_sources/remote_data_source.dart';
import 'package:flutter_pokemon_clean_architecture/data/repositories/pokemon_repository_impl.dart';
import 'package:flutter_pokemon_clean_architecture/domain/repositories/pokemon_repository.dart';
import 'package:flutter_pokemon_clean_architecture/domain/use_cases/get_pokemon.dart';

final injector = GetIt.instance;

void init() {
  // BLoC
  injector.registerFactory(() => PokemonBloc(injector()));

  // Use case
  injector.registerLazySingleton(() => GetPokemon(injector()));

  // Repository
  injector.registerLazySingleton<PokemonRepository>(() => PokemonRepositoryImpl(
        remoteDataSource: injector(),
        //localDataSource: sl(),
      ));

  // Data sources
  injector.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(client: injector()));

  // Core
  injector.registerLazySingleton(() => http.Client());
}
