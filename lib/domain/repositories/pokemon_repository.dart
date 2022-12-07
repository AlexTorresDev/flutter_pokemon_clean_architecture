import 'package:dartz/dartz.dart';

import 'package:flutter_pokemon_clean_architecture/core/errors/failure.dart';
import 'package:flutter_pokemon_clean_architecture/domain/entities/pokemon.dart';

abstract class PokemonRepository {
  Future<Either<Failure, List<Pokemon>>> getPokemonList(int limit, int offset);
  Future<Either<Failure, List<Pokemon>>> getPokemon(String name);
}
