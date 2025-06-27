import 'package:equatable/equatable.dart';
import 'package:flutter_pokemon_clean_architecture/src/config/utils/sprites.dart';
import 'package:flutter_pokemon_clean_architecture/src/domain/models/sprite.dart';

class PokemonModel extends Equatable {
  const PokemonModel({
    required this.baseExperience,
    required this.height,
    required this.id,
    required this.isDefault,
    required this.locationAreaEncounters,
    required this.name,
    required this.order,
    required this.weight,
    required this.sprites,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      baseExperience: json["base_experience"],
      height: json["height"],
      id: json["id"],
      isDefault: json["is_default"] is int
          ? json["is_default"] == 1
          : json["is_default"],
      locationAreaEncounters: json["location_area_encounters"],
      name: json["name"],
      order: json["order"] ?? json["sort_order"],
      weight: json["weight"],
      sprites: json['sprites'] is Map<String, dynamic>
          ? flattenSprites(json['sprites'])
          : json['sprites'],
    );
  }

  final int? baseExperience;
  final int? height;
  final int? id;
  final bool? isDefault;
  final String? locationAreaEncounters;
  final String? name;
  final int? order;
  final int? weight;
  final List<SpriteModel> sprites;

  Map<String, dynamic> toJson() => {
    "base_experience": baseExperience,
    "height": height,
    "id": id,
    "is_default": isDefault,
    "location_area_encounters": locationAreaEncounters,
    "name": name,
    "sort_order": order,
    "weight": weight,
    "sprites": sprites.map((s) => s.toJson()).toList(),
  };

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
