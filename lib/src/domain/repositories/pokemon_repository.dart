import 'package:dartz/dartz.dart';

import 'package:flutter_pokemon_clean_architecture/src/core/errors/failure.dart';
import 'package:flutter_pokemon_clean_architecture/src/core/params/pokemon_param.dart';
import 'package:flutter_pokemon_clean_architecture/src/domain/entities/pokemon.dart';

abstract class PokemonRepository {
  Future<Either<Failure, List<Pokemon>>> getPokemonList(PokemonParam params);
  Future<Either<Failure, List<Pokemon>>> getPokemon(String name);
}
