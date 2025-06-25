import 'package:dartz/dartz.dart';
import 'package:flutter_pokemon_clean_architecture/src/core/errors/failure.dart';
import 'package:flutter_pokemon_clean_architecture/src/domain/models/pokemon.dart';

abstract class PokemonGateway {
  Future<Either<Failure, List<PokemonModel>>> getPokemonList(
    int limit,
    int offset,
  );
  Future<Either<Failure, List<PokemonModel>>> getPokemon(String name);
}
