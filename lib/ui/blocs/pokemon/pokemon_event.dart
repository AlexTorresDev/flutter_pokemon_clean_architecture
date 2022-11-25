import 'package:equatable/equatable.dart';

abstract class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object?> get props => [];
}

class OnGetAll extends PokemonEvent {
  const OnGetAll();

  @override
  List<Object?> get props => [];
}

class OnNameChanged extends PokemonEvent {
  const OnNameChanged(this.name);

  final String name;

  @override
  List<Object?> get props => [name];
}
