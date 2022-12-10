import 'package:dartz/dartz.dart';
import 'package:flutter_pokemon_clean_architecture/src/core/errors/failure.dart';
import 'package:flutter_pokemon_clean_architecture/src/core/params/pokemon_param.dart';
import 'package:flutter_pokemon_clean_architecture/src/core/use_case.dart';
import 'package:flutter_pokemon_clean_architecture/src/domain/entities/pokemon.dart';
import 'package:flutter_pokemon_clean_architecture/src/domain/repositories/pokemon_repository.dart';

class GetPokemonList implements UseCase<List<Pokemon>, PokemonParam> {
  GetPokemonList(this._repository);

  final PokemonRepository _repository;

  @override
  Future<Either<Failure, List<Pokemon>>> call(PokemonParam params) =>
      _repository.getPokemonList(params);
}
