import 'package:equatable/equatable.dart';
import 'package:flutter_pokemon_clean_architecture/src/domain/entities/sprite.dart';

class Pokemon extends Equatable {
  const Pokemon({
    this.baseExperience,
    this.height,
    this.id,
    this.isDefault,
    this.locationAreaEncounters,
    this.name,
    this.order,
    this.weight,
    this.sprites,
  });

  final int? baseExperience;
  final int? height;
  final int? id;
  final bool? isDefault;
  final String? locationAreaEncounters;
  final String? name;
  final int? order;
  final int? weight;
  final Sprite? sprites;

  @override
  List<Object?> get props => [
        baseExperience,
        height,
        id,
        isDefault,
        locationAreaEncounters,
        name,
        order,
        weight,
        sprites,
      ];
}
