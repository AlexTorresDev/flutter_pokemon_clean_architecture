import 'package:flutter_pokemon_clean_architecture/data/models/sprite_model.dart';
import 'package:flutter_pokemon_clean_architecture/domain/entities/pokemon.dart';

class PokemonModel extends Pokemon {
  const PokemonModel({
    int? baseExperience,
    int? height,
    int? id,
    bool? isDefault,
    String? locationAreaEncounters,
    String? name,
    int? order,
    int? weight,
    SpriteModel? sprites,
  }) : super(
          baseExperience: baseExperience,
          height: height,
          id: id,
          isDefault: isDefault,
          locationAreaEncounters: locationAreaEncounters,
          name: name,
          order: order,
          weight: weight,
          sprites: sprites,
        );

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
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
        sprites: json["sprites"] != null
            ? SpriteModel.fromJson(json["sprites"])
            : null,
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
        // TODO: Fix this
        //"sprites": sprites!.toJson(),
      };
}
