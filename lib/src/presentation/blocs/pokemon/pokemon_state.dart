import 'package:equatable/equatable.dart';
import 'package:flutter_pokemon_clean_architecture/src/domain/entities/pokemon.dart';

abstract class PokemonState extends Equatable {
  const PokemonState([this._props = const []]);

  final List<Object?> _props;

  @override
  List<Object?> get props => [_props];
}

class PokemonLoading extends PokemonState {}

class PokemonError extends PokemonState {
  PokemonError(this.message) : super([message]);

  final String message;
}

class PokemonHasList extends PokemonState {
  PokemonHasList(this.result, this.offset) : super([result, offset]);

  final List<Pokemon> result;
  final int offset;
}

class PokemonHasData extends PokemonState {
  PokemonHasData(this.result) : super([result]);

  final Pokemon result;
}

class PokemonHasDetails extends PokemonState {
  PokemonHasDetails(this.result) : super([result]);

  final Pokemon result;
}
