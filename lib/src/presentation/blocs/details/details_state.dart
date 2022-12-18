import 'package:equatable/equatable.dart';
import 'package:flutter_pokemon_clean_architecture/src/domain/entities/pokemon.dart';

abstract class DetailsState extends Equatable {
  const DetailsState([this._props = const []]);

  final List<Object?> _props;

  @override
  List<Object?> get props => [_props];
}

class DetailsLoading extends DetailsState {}

class DetailsError extends DetailsState {
  DetailsError(this.message) : super([message]);
  final String message;
}

class DetailsHasData extends DetailsState {
  DetailsHasData(this.pokemon) : super([pokemon]);
  final Pokemon pokemon;
}
