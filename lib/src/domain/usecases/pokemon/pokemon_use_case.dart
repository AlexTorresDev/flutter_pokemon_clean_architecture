import 'package:dartz/dartz.dart';
import 'package:flutter_pokemon_clean_architecture/src/core/errors/failure.dart';
import 'package:flutter_pokemon_clean_architecture/src/domain/repositories/pokemon_repository.dart';
import 'package:flutter_pokemon_clean_architecture/src/domain/models/pokemon.dart';

class PokemonUsecase {
  const PokemonUsecase(this._pokemonGateway);

  final PokemonGateway _pokemonGateway;

  Future<Either<Failure, List<PokemonModel>>> getAll(int limit, int offset) =>
      _pokemonGateway.getPokemonList(limit, offset);

  Future<Either<Failure, List<PokemonModel>>> getByName(String name) =>
      _pokemonGateway.getPokemon(name);
}
