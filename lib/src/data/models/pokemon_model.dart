import 'package:flutter_pokemon_clean_architecture/src/domain/entities/pokemon.dart';

import 'sprite_model.dart';

class PokemonModel extends Pokemon {
  const PokemonModel({
    super.baseExperience,
    super.height,
    super.id,
    super.isDefault,
    super.locationAreaEncounters,
    super.name,
    super.order,
    super.weight,
    SpriteModel? super.sprites,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
    baseExperience: json["base_experience"],
    height: json["height"],
    id: json["id"],
    isDefault:
        json["is_default"] is int
            ? json["is_default"] == 1
            : json["is_default"],
    locationAreaEncounters: json["location_area_encounters"],
    name: json["name"],
    order: json["order"] ?? json["sort_order"],
    weight: json["weight"],
    sprites:
        json["sprites"] != null ? SpriteModel.fromJson(json["sprites"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "base_experience": baseExperience,
    "height": height,
    "id": id,
    "is_default": isDefault,
    "location_area_encounters": locationAreaEncounters,
    "name": name,
    "sort_order": order,
    "weight": weight,
    "sprites": (sprites as List<SpriteModel>).map((e) => e.toJson()).toList(),
  };
}
