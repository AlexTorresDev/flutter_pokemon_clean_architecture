import 'package:dartz/dartz.dart';
import 'package:flutter_pokemon_clean_architecture/core/errors/failure.dart';
import 'package:flutter_pokemon_clean_architecture/domain/entities/pokemon.dart';
import 'package:flutter_pokemon_clean_architecture/domain/repositories/pokemon_repository.dart';

class GetPokemon {
  final PokemonRepository repository;

  GetPokemon(this.repository);

  Future<Either<Failure, Pokemon>> call(String name) =>
      repository.getPokemon(name);
}
