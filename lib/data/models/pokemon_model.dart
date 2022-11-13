import 'package:equatable/equatable.dart';
import 'package:flutter_pokemon_clean_architecture/domain/entities/pokemon.dart';

class PokemonModel extends Equatable {
  const PokemonModel({
    this.baseExperience,
    this.height,
    this.id,
    this.isDefault,
    this.locationAreaEncounters,
    this.name,
    this.order,
    this.weight,
  });

  final int? baseExperience;
  final int? height;
  final int? id;
  final bool? isDefault;
  final String? locationAreaEncounters;
  final String? name;
  final int? order;
  final int? weight;

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        baseExperience: json["base_experience"],
        height: json["height"],
        id: json["id"],
        isDefault: json["is_default"],
        locationAreaEncounters: json["location_area_encounters"],
        name: json["name"],
        order: json["order"],
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "base_experience": baseExperience,
        "height": height,
        "id": id,
        "is_default": isDefault,
        "location_area_encounters": locationAreaEncounters,
        "name": name,
        "order": order,
        "weight": weight,
      };

  Pokemon toEntity() => Pokemon(
        baseExperience: baseExperience,
        height: height,
        id: id,
        isDefault: isDefault,
        locationAreaEncounters: locationAreaEncounters,
        name: name,
        order: order,
        weight: weight,
      );

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
      ];
}
